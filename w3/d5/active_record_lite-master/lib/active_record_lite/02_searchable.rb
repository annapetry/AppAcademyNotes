require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)

    where_line = params.keys.map do |key|
      "#{key} = ?"
    end.join(" AND ")

    vals = params.map do |key, val|
      val
    end

    result = DBConnection.execute(<<-SQL, vals)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL

    self.parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
