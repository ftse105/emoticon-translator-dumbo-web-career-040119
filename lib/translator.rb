require "yaml"

def load_library(path)
  all_emoticon = YAML.load_file(path)
  emoticons = Hash.new

  emoticons["get_emoticon"] = Hash.new
  emoticons["get_meaning"] = Hash.new

  all_emoticon.each do |set, word|
    emoticons["get_emoticon"][set.first] = set.last
    emoticons["get_meaning"][set.last] = word
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end
