require 'uri'
require 'net/http'
require 'json'

api_key = ENV['API_KEY']
uri_string = 'https://language.googleapis.com/v1/documents:analyzeEntities?key='+api_key
puts uri_string

translated_text = "TO THE PUBLIC GOOD the dispatches For Obama, the mustard is from Dijon"

body_request = {
    "document" => {
        "type" => "PLAIN_TEXT",
        "content" => translated_text
    },
    "encodingType": "UTF8"
}.to_json

req_uri = URI(uri_string)

res = Net::HTTP.post req_uri, body_request, "Content-Type" => "application/json"
puts res.body
response_data = JSON.parse(res.body)
response_data["entities"].each do |entity|
  puts "word: #{entity["name"]}, type: #{entity["type"]}"
end