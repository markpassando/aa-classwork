require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns
      @columns
    else
      results = DBConnection.execute2(<<-SQL)
          SELECT
            *
          FROM
            #{self.table_name}
        SQL

        @columns = results.first.map(&:to_sym)
      end
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do
        #self.instance_variable_get("@#{column}")
        self.attributes[column]
      end

      define_method("#{column}=".to_sym) do |val|
        #self.instance_variable_set("@#{column}", val)

        self.attributes[column] = val
      end
    end
    #self.columns.each
  end

  def self.table_name=(table_name)
    self.instance_variable_set("@table_name", table_name)
    #debugger
    #@table_name = table_name
  end

  def self.table_name
    if @table_name.nil?
      self.to_s.tableize
    else
      self.instance_variable_get("@table_name")
      #@table_name
    end
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL

      self.parse_all(results)
  end

  def self.parse_all(results)
    total = results.map do |item|
      self.new(item)
    end
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
        WHERE
          id = #{id}
      SQL
    if result.empty?
      nil
    else
      self.new(result.first)
    end
  end

  def initialize(params = {})
    init_helper(params)
  end

  def init_helper(params)
    results = []
    class_columns = self.class.columns

    params.each do |k, v|
      key = k.to_sym
      raise "unknown attribute 'favorite_band'" unless class_columns.include?(key)
      self.send("#{k}=".to_sym, v)
    end
  end

  def attributes
    if @attributes.nil?
      @attributes = {}
    else
      @attributes
    end
  end

  def attribute_values
    self.class.columns.map do |method|
      self.send(method)
    end
    #self.attributes.values
  end

  def insert
    col_names = self.class.columns[1..-1].join(", ")
    question_marks = (["?"] * self.class.columns[1..-1].length).join(", ")
    # col_names = self.class.columns.join(", ")
    # question_marks = (["?"] * self.class.columns.length).join(", ")
    #Not passing in ID
    values = self.attribute_values.drop(1)
    inserted = DBConnection.execute(<<-SQL, *values)
        INSERT INTO
          #{self.class.table_name} (#{col_names})
        VALUES
          (#{question_marks})
      SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_vals = self.class.columns[1..-1].map { |col| "#{col} = ?" }.join(", ")
    id = attribute_values.first
    values = self.attribute_values.drop(1)

    updated = DBConnection.execute(<<-SQL, *values)
        UPDATE
          #{self.class.table_name}
        SET
        --col1 = ?, col2 = ?, col3 = ?
          #{set_vals}
        WHERE
          id = #{id}
      SQL
  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
  end
end
