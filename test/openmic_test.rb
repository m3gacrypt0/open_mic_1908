require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/openmic'

class OpenMicTest < Minitest::Test
  def setup
       @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

       @sal = User.new("Sal")
       @ali = User.new("Ali")

       @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
       @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
       @ali.learn(@joke_1)
       @ali.learn(@joke_2)
  end

  def test_it_exists
      assert_instance_of OpenMic, @open_mic
  end

  def test_it_has_attributes
       assert_equal "Comedy Works", @open_mic.location
       assert_equal "11-20-18", @open_mic.date
       assert_equal [], @open_mic.performers
  end

  def test_method_welcome
       @open_mic.welcome(@sal)
       assert_equal [@sal], @open_mic.performers

       @open_mic.welcome(@ali)
       assert_equal [@sal, @ali], @open_mic.performers
  end

  def test_method_repeated_jokes
       assert_equal false, @open_mic.repeated_jokes?
  end

  def test_method_repeated_jokes_true
       @open_mic.welcome(@sal)
       @open_mic.welcome(@ali)
       @ali.tell(@sal, @joke_1)
       assert_equal true, @open_mic.repeated_jokes?
  end
end
