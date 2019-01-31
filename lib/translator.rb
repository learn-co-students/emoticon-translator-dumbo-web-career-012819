# require modules here
require "yaml"
require "pry"


def load_library(emoticon_hash)
  final_hash = {}
  emoticon_hash = YAML.load_file(emoticon_hash)
  emoticon_hash.each do |meaning, emoticons|
    final_hash["get_emoticon"] ||= {emoticons[0] => emoticons[1]}
    final_hash["get_meaning"]  ||= {emoticons[1] => meaning}
  end
  emoticon_hash.each do |meaning, emoticons|
    final_hash["get_emoticon"].store(emoticons[0], emoticons[1])
    final_hash["get_meaning"].store(emoticons[1], meaning)
  end
  final_hash
end

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path).each do |emoticon_or_meaning, emoticon_hash|
    emoticon_hash.each do |american, japanese|
      if emoticon == american
        return japanese
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  load_lib = load_library(file_path)
    load_lib["get_meaning"].each do |japanese, meaning|
      if emoticon == japanese
        return meaning
      end
  end
  "Sorry, that emoticon was not found"
end