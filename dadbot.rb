require 'telegram_bot'
require_relative 'input_parser'

class DadBot

  def initialize(token: ENV['TG_API_TOKEN'])
    if token.instance_of? String
      @token = token
      @bot = TelegramBot.new(token: @token, logger: Logger.new(STDOUT))
    else
      # Exit program if token doesn't exist
      abort('Must define telegram api token first')
    end
  end

  # Subscribe to update loop
  def subscribe
    @bot.get_updates(fail_silently: true) do |message|
      parser = InputParser.new(message.text)
      subject = parser.parse_subject
      if subject != nil
        response = "Hello #{subject}, I'm dad."
        message.reply do |reply|
          reply.text = response
          reply.send_with(@bot)
        end
      end
    end
  end

end
