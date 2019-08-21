class User
  attr_reader :name, :jokes

  def initialize(name)
       @name = name
       @jokes = []
  end

  def learn(joke)
       @jokes << joke
  end

  def tell(user, joke)
       user.learn(joke)
       # binding.pry
  end

  def joke_by_id(id)
       @jokes.find {|joke_in_jokes|  joke_in_jokes.id == id}
  end

end
