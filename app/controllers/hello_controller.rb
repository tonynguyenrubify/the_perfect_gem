class HelloController < ApplicationController
  def test
    render :text => "hello world"
  end
end