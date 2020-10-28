require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    @columns = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
    SQL
    @columns = @columns[0].map{|e| e.to_sym}
  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= table_name_ization
  end

  def self.table_name_ization
    result = ""
    self.to_s.each_char.with_index do |c,i|
      if c == c.upcase && i != 0
        result += "_" + c.downcase
      else
        result += c.downcase
      end
    end
    result + "s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
    @attributes = {}

    self.class.columns.each do |column|
      @attributes[column] = instance = instance_variable_get("@"+column.to_s) unless instancev.nil?
    end
    @attributes
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
