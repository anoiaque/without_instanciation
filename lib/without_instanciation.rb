module ActiveRecord
  class Base
    class << self
      def without_instanciation opt={}
        eigenclass = (class << self; self end)
        Psychanalyst.redefine(eigenclass, :find_by_sql) do |sql|
          connection.select_all(sanitize_sql(sql), "#{name} Load")
        end
        result = yield
        Psychanalyst.undefine(eigenclass, :find_by_sql)
        result
      end
    end
  end
end

module Psychanalyst
  
  def self.redefine klass, method, &block
    klass.send(:alias_method, original_method(method), method)
    klass.send(:define_method, method) do |*params|
      instance_exec(*params, &block)
    end
  end

  def self.undefine klass, method
    klass.send(:undef_method, method)
    klass.send(:alias_method, method, original_method(method))
  end

  def self.original_method method
    ('original_' + method.to_s).to_sym
  end
  
end