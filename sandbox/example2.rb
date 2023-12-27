class SuperClass
    class << self
      def foo(arg)
        # Define behavior for the `foo` method call
        puts "foo called with argument: #{arg}"
      end
    end

    def boo(arg:)
      p "boo: #{arg}"
    end

end

  class MyClass < SuperClass
    foo :str  # Now this is valid
  end

  a = MyClass.new
  a.boo(arg: "way")
