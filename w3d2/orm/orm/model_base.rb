require 'active_support/inflector'

class ModelBase
  def self.find_by_id(id)
    query = QuestionsDataBase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.get_table}
      WHERE
        id = ?
    SQL

    self.new(query.first)
  end

  def self.all
    query = QuestionsDataBase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.get_table}
    SQL

    query.map { |r| self.new(r) }
  end

  def self.get_table
    self.to_s.tableize
  end

  def self.where(options)
    if options.is_a?(Hash)
      where_string = options.map { |k,v| "#{k} = '#{v}'"}.join(" AND ")
    else
      where_string = options
    end

    query = QuestionsDataBase.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.get_table}
      WHERE
        #{where_string}
    SQL

    query.map { |q| self.new(q) }
  end

  def self.method_missing(method_name, *args)
    method_string = method_name.to_s
    if method_string.start_with?("find_by")
      columns = method_string["find_by_".length..-1].split('_and_')
      options = Hash.new
      columns.each_index { |i| options[columns[i]] = args[i] }
      self.where(options)
    else
      super
    end
  end

  attr_accessor :table_name

  def save
    variables_with_id = self.instance_variables
    columns_with_id = variables_with_id.map {|var| self.instance_variable_get(var)}.rotate
    variables = variables_with_id[1..-1]

    if @id
      column_setter = variables.map {|var| "#{var}"[1..-1] + " = ?"}.join(', ')

      update(columns_with_id, column_setter)
    else
      columns = columns_with_id[0...-1]
      insert_setter = variables.map {|var| "#{var}"[1..-1]}.join(', ')
      value_setter = variables.map {|var| "?"}.join(', ')

      create(insert_setter, value_setter, columns)
    end
  end

  def update(columns_with_id, column_setter)
    QuestionsDataBase.execute(<<-SQL, *columns_with_id)
      UPDATE
        #{self.class.get_table}
      SET
        #{column_setter}
      WHERE
        id = ?
    SQL
  end

  def create(insert_setter, value_setter, columns)
    QuestionsDataBase.execute(<<-SQL, *columns)
      INSERT INTO
        #{self.class.get_table} (#{insert_setter})
      VALUES
        (#{value_setter})
    SQL

    @id = QuestionsDataBase.instance.last_insert_row_id
  end

end
