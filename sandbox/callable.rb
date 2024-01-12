module Callable
  class Base
    def initialize
      p "init .."
    end
  end
end

module Callable
  class Noop < ::Callable::Base
    def m1
      p "m1"
    end

    def m2
      nil
    end
  end
end

module Callable
  def self.class_m1
    p "class_m1"
    obj = Callable::Noop.new
    obj.m1
  end
end

Callable.class_m1