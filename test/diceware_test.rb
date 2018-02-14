# frozen_string_literal: true
require File.expand_path '../test_helper.rb', __FILE__

class DicewareTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_hello_world
    get '/'
    assert last_response.ok?
  end
end
