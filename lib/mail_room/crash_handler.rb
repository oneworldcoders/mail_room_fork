require 'date'

module MailRoom
  class CrashHandler
    SUPPORTED_FORMATS = %w[json none]

    def initialize(stream=STDOUT)
      @stream = stream
    end

    def handle(error, format)
      if format == 'json'
        @stream.puts json(error)
        return
      end

      raise error
    end

    private

    def json(error)
      { time: DateTime.now.iso8601(3), severity: :fatal, message: error.message, backtrace: error.backtrace }.to_json
    end
  end
end
