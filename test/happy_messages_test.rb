require 'test_helper'

class HappyMessagesTest < ActiveSupport::TestCase
  class FooController < ActionController::Base
    include HappyMessages

    def flash
      @flash ||= {}
    end
  end

  def setup
    @controller = FooController.new
  end

  test "FooController should set up messages correctly" do
    @controller.send(:setup_messages)

    assert_equal(@controller.messages, { :notice => [], :error => [] })
  end

  test "FooController can add notices" do
    @controller.send(:setup_messages)
    @controller.send(:add_notice, "Hello there.")
    @controller.send(:add_notice, "Hi again.")    

    assert_equal(@controller.flash[:messages][:notice], ["Hello there.", "Hi again."])
  end

  test "FooController can add errors" do
    @controller.send(:setup_messages)
    @controller.send(:add_error, "Hello there.")
    @controller.send(:add_error, "Hi again.")

    assert_equal(@controller.flash[:messages][:error], ["Hello there.", "Hi again."])
  end

  test ":now messages appear immediately" do
    @controller.send(:setup_messages)
    @controller.send(:add_notice, "Hello there.")
    @controller.send(:add_notice, "Hi again.", :now => true)

    assert_equal(@controller.flash[:messages][:notice], ["Hello there."])
    assert_equal(@controller.messages[:notice], ["Hi again."])
  end
end
