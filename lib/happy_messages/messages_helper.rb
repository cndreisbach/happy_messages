module HappyMessages
  module MessagesHelper
    def render_messages
      output = []

      @messages.each do |msg_type, messages|
        messages.each do |message|
          output << render_message(msg_type, message)
        end
      end

      content_tag(:div, output.join("\n"), :id => 'messages') unless output.empty?
    end

    def render_message(msg_type, message)
      content_tag(:div, message, :class => "message #{msg_type}")
    end
  end
end