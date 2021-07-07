# require modules here
require 'pry'
require "yaml"






def load_library(file_path)
translator = YAML.load_file(file_path)
translate_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  translator.each do |word, emoticon_array|
    english = emoticon_array[0]
    japanese = emoticon_array[1]

    translate_hash["get_meaning"][japanese] = word
    translate_hash["get_emoticon"][english] = japanese
#binding.pry
  end
   translate_hash
   #binding.pry
 end



def get_japanese_emoticon(file_path, emoticon)
 emoticon_hash = load_library(file_path)
 #binding.pry

  if emoticon_hash["get_emoticon"][emoticon]
     emoticon_hash["get_emoticon"][emoticon]
     #binding.pry
  else
     return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path,emoticon)
  emoticon_hash = load_library(file_path)

     if emoticon_hash["get_meaning"][emoticon]
        emoticon_hash["get_meaning"][emoticon]
     else
       return "Sorry, that emoticon was not found"
#binding.pry
     end
   end
