require 'nokogiri'
include Nokogiri

class XBRL_Document < XML::SAX::Document

  def initialize
    super()
    @contexts = {}
    @current_context = nil
    @in_identifier = false
  end

  def get_contexts
    @contexts
  end
  
  def start_element name, attributes = []
    if name == "xbrli:context"
      @current_context = Hash[attributes]["id"]
    elsif name == "xbrli:identifier" and @current_context != nil
      @in_identifier = true
    end
  end

  def end_element name
    if name == "xbrli:identifier"
      @in_identifier = false
    end
  end

  def characters string
    if @in_identifier
      #if @contexts[@current_context] == nil
        @contexts[@current_context] = string
      #else
        # @contexts[@current_context] += string
      #end
    end
  end
end

xbrl = XBRL_Document.new

parser = XML::SAX::Parser.new(xbrl)

parser.parse(open("xide-20140331.xml"))

puts xbrl.get_contexts
