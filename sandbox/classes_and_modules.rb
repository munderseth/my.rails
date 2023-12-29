module Big
  class Small
    def s1
      p "s1"
    end
  end
  def doit
    p "doit"
  end
end

# Requires using "::" to scope the class defined within the module
class Test1 < Big::Small
  include Big # instance method(s)
end

class Test2 < Big::Small
  extend Big # class method(s)
end

t1 = Test1.new
t1.doit
t1.s1

t2 = Test2.new
Test2.doit
t2.s1