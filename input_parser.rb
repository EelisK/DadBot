require 'enumerator'
require_relative 'string_util'

class InputParser

  # Add string utilities
  include StringUtil

  # Regex for lower case pun -able sentences
  PUN_REGEX = /((i'm)|(i\sam)|([^\S]im)|(^im))\s/

  def initialize(input)
    # Replace multiple consecutive whitespaces with single ones
    @input = single_whitespace(input).downcase.strip
  end

  def pun_material
    PUN_REGEX.match?(@input)
  end

  def parse_subject
    if pun_material
      position = PUN_REGEX =~ @input
      length = PUN_REGEX.match(@input)[0].length
      index_after = position + length
      if index_after < @input.length
        cut_string = @input[index_after..@input.length]
        sentence_ending_chars = /[.,!?"':;]/
        sentences = cut_string.split sentence_ending_chars
        cut_string = title_case(sentences[0])
        return cut_string
      end
    end
  end

  def input
    @input
  end
end