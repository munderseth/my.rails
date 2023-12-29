class Hello
  def self.from_the_class
    p "Hello, from a class method"
  end

  def from_an_instance
    p "Hello, from an instance method"
  end
end

Hello.from_the_class
Hello.new.from_an_instance