module ExamLocator
  def self.naive_fuzzy_search(const_term)
    return lambda { |searched|
      match1 = const_term.eql? searched
      
      trimmed_search = const_term.gsub(/\s/, "")
      trimmed_const = searched.gsub(/\s/, "")
      
      match2 = trimmed_search.eql? trimmed_const
      match3 = trimmed_const.casecmp(trimmed_search).eql? 0

      return match1 || match2 || match3
    }
  end
end