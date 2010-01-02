## Extensions to core methods that are useful in controllers and
## elsewhere.

## Inspired by Ruby on Rails and others.

class Hash

  # From Rails
  # (c) 2005-2009 David Heinemeier Hansson (and others)
  def symbolize_keys
    inject({}) do |options, (key, value)|
      options[(key.to_sym rescue key) || key] = value
      options
    end
  end

  # Selects a random value from a Hash
  def random_value
    values.random
  end
  
end

class Array

  # Selects a random element from an Array
  def random
    at(rand(self.length - 1))
  end
  
end

class Range

  # Selects a random value from a Range object
  def random_value

    # If the Range is of kind Integer, use a better performing method.
    if first.kind_of?(Integer)
      difference = last - first
      first + rand(difference)

    # Otherwise, convert to an Array and select a random element.
    else
      array = to_a
      array[rand(array.length)]
    end
  end
  
end


class String
  
  # Turns a lower case word with underscores into a camel case word.
  def camelize
    split("_").map do |word|
      word[0...1].upcase + word[1...word.length]
    end.join
  end

  # Removes a string from another string.
  def subtract(string_to_remove)
    gsub(string_to_remove, "")
  end
  
  alias_method :-, :subtract

  # Converts a String to a Boolean (TrueClass, FalseClass).
  def to_boolean
    self == "true"
  end

  alias_method :to_b, :to_boolean

end

  
