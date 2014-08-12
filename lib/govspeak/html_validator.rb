class Govspeak::HtmlValidator
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def invalid?
    !valid?
  end

  def valid?
    dirty_html = govspeak_to_html
# f334128f7c66ea07c66d586edcb487b956b948fc
    clean_html = Govspeak::HtmlSanitizer.new(dirty_html).sanitize
# de53e90fb423f8e411d648ff1039cefb13221281
    require "pry"; binding.pry if $asd
    normalise_html(dirty_html) == normalise_html(clean_html)
  end

  # Make whitespace in html tags consistent
  def normalise_html(html)
    Nokogiri::HTML.parse(html).to_s
  end

  def govspeak_to_html
    Govspeak::Document.new(string).to_html
  end
end
