# HappyMessages

require File.join(File.dirname(__FILE__), 'happy_messages', 'messages_helper')

module HappyMessages
  def self.included(base)
    base.module_eval do
      before_filter :setup_messages
      helper HappyMessages::MessagesHelper
      attr_reader :messages
    end    
  end

  private

  def add_notice(message, options = {})
    add_message(:notice, message, options)
  end

  def add_error(message, options = {})
    add_message(:error, message, options)
  end

  def add_message(msg_type, message, options = {})
    if options.delete(:now)
      @messages[msg_type] << message
    else
      flash[:messages][msg_type] << message
    end
  end

  def setup_messages
    @messages = flash[:messages]
    @messages ||= {}
    @messages[:notice] ||= []
    @messages[:error] ||= []

    flash[:messages] = { :notice => [], :error => [] }
  end
end