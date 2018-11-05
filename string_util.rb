module StringUtil
  def title_case(str)
    str.gsub(/\w+/) do |word|
      word.capitalize
    end
  end

  def single_whitespace(str)
    str.gsub(/\s+/, " ")
  end

end