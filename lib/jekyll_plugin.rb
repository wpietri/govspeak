class Jekyll::Converters::Markdown::MyCustomProcessor
  def initialize(config)
    require 'govspeak'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Govspeak.'
    raise FatalException.new("Missing dependency: govspeak")
  end

  def convert(content)
    Govspeak::Document.new(content).to_html
  end
end