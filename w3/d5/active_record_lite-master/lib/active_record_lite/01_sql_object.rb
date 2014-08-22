require_relative 'db_connection'
require 'active_support/inflector'
#NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
#    of this project. It was only a warm up.

class SQLObject
  def self.columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{table_name}"
    SQL

    cols[0].map do |var|
      var.to_sym
    end
  end

  def self.finalize!
   columns.each do |variable|
      define_method("#{variable}") do
        attributes[variable]
      end

      define_method("#{variable}=") do |value|
        attributes[variable] = value
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if self.to_s == "Human"
      @table_name = "humans"
    else
      @table_name = self.to_s.downcase.pluralize
    end
  end

  def self.all
    result_array = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    self.parse_all(result_array)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    result_array = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
      #{table_name}.id = ?
    SQL

    self.parse_all(result_array).first
  end

  def attributes
    @attributes ||= {}
  end

  def insert
    col_names_num = self.class.columns.count
    col_names = self.class.columns.join(",")
    question_marks = (["?"] * col_names_num).join(",")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
      (#{question_marks})
    SQL

    id = DBConnection.last_insert_row_id

    self.send(:id=, id)
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      sym = attr_name.to_sym
      if self.class.columns.include?(sym)
        self.send("#{sym}=", value)
      else
        raise Exception.new("unknown attribute '#{attr_name}'")
      end
    end
  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
  end

  def update
    col_values = self.class.columns.map do |attr_name|
      "#{attr_name} = ?"
    end.join(",")

    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_values}
      WHERE
        id = ?
    SQL
  end

  def attribute_values
    self.class.columns.map do |col_name|
      self.send(col_name)
    end
  end

end
