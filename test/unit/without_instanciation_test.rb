require 'test_helper'

class WithoutInstanciationTest < ActiveSupport::TestCase
  
  setup do |variable|
    (1..10).each { |n| User.create!(:name => "Number #{n}") }
  end
  
  test "it should get all users" do
    users = User.without_instanciation { User.all }
    
    assert_equal 10, users.count
  end
  
  test "it should get each as Hash, not User object" do
    users = User.without_instanciation { User.all }
    user = users.first
    
    assert_equal Hash, user.class
    assert_equal "Number 1", user['name']
  end
  
  test "it should work fine with where query" do
    users = User.without_instanciation { User.where(:name => "Number 10") }
    
    assert_equal 1, users.count
    assert_equal "Number 10", users.first['name']
  end
  
  
end
