class ApplicationController < ActionController::Base
  def hello
    render html: "hello from post it!"
  end
end
