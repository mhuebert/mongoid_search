require 'fast_stemmer'
class KeywordsExtractor
  def self.extract(text)
    # return [] if text.blank?
    keywords = []
    [*text].each do |text|
      text.mb_chars.normalize(:kd).to_s.gsub(/[^\x00-\x7F]/,'').downcase.split(/[\s\.\-_:;'",]+/).each do |word|
        keywords << word.stem
      end
    end
    keywords
  end
end