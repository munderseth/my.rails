
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


class What
  def m1
    p "m1"
  end
  def m2
    p "m2"
  end
end

class When < What

end

class Again
  include Big
end

b = When.new
b.m1

c = Again.new
c.doit