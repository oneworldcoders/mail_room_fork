# frozen_string_literal: true

module MailRoom
  class Connection
    attr_reader :mailbox, :new_message_handler

    def initialize(mailbox)
      @mailbox = mailbox
      @stopped = false
    end

    def on_new_message(&block)
      @new_message_handler = block
    end

    def stopped?
      @stopped
    end

    def wait
      raise NotImplementedError
    end

    def quit
      @stopped = true
    end
  end
end
