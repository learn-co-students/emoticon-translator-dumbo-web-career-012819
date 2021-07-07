require "yaml"
# emojis = YAML.load_file('emoticons.yml')

def load_library(file_path)
  file_hash = YAML.load_file(file_path)
  new_file = {"get_emoticon" => {}, "get_meaning" => {}}

  file_hash.each do |meaning, emojis|
    english_emoji = emojis[0]
    japanese_emoji = emojis[1]

    new_file["get_emoticon"][english_emoji] = japanese_emoji
    new_file["get_meaning"][japanese_emoji] = meaning
  end

  return new_file
end

def get_japanese_emoticon(yaml_file, emoticon)
  emoticon_hash = load_library(yaml_file)
  get_emoticon = emoticon_hash["get_emoticon"]

  if get_emoticon.key?(emoticon)
    return get_emoticon[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml_file, emoticon)
  emoticon_hash = load_library(yaml_file)
  get_meaning = emoticon_hash["get_meaning"]

  if get_meaning.key?(emoticon)
    return get_meaning[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
