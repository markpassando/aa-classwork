require_relative '02_searchable'
require 'active_support/inflector'

require 'byebug'
# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  attr_accessor :class_name, :primary_key, :foreign_key

  def initialize(name, options = {})
    options = {
      class_name: name.capitalize.singularize,
      primary_key: :id,
      foreign_key: "#{name}_id".to_sym
    }.merge(options)

    @class_name = options[:class_name]
    @primary_key = options[:primary_key]
    @foreign_key = options[:foreign_key]

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    #debugger
    options = {
      class_name: name.capitalize.singularize,
      primary_key: :id,
      foreign_key: "#{self_class_name}_id".downcase.to_sym
    }.merge(options)

    @class_name = options[:class_name]
    @primary_key = options[:primary_key]
    @foreign_key = options[:foreign_key]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    #debugger
    options = BelongsToOptions.new(name.to_s, options)
    define_method(name) do
      #debugger
      for_key = self.send(options.foreign_key)
      target_model = options.model_class
      target_model.where(id: for_key.to_s).first
    end

  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
  # Mixin Associatable here...
end
