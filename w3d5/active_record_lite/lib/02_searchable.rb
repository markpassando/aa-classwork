require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'
module Searchable
  def where(params)

    # where_line = params.map { |col, v| "#{col} = ?" if v}.join(" AND ")
    # values = params.map { |_, v| v if v}
    where_line = params.map { |col, v| "#{col} = ?"}.join(" AND ")
    values = params.map { |_, v| v}
    #debugger
    results = DBConnection.execute(<<-SQL, *values)
        SELECT
          *
        FROM
          #{self.table_name}
        WHERE
          #{where_line}
      SQL

      self.parse_all(results)
  end
end

class SQLObject
  extend Searchable
  # Mixin Searchable here...
end
