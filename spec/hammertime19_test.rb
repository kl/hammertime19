#encoding: utf-8

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)) + "/../lib")

require 'hammertime19'
require 'minitest/spec'
require 'minitest/autorun'

Hammertime.test = true

describe Hammertime do

  it "intercepts a raised exception" do
    result = raise "boom!"
    result.class.must_equal Mutex  # because the last thing we do is lock the mutex (which is returned)
  end
  
end
