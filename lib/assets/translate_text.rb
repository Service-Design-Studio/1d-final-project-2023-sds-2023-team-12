require 'uri'
require 'net/http'
require 'json'
require_relative 'language_maps'

def response_from_api_call
    api_key='AIzaSyD_7AsEHBZ1zOq0ANvxwYV_7E706lhp8Xg'
    uri_string = 'https://translation.googleapis.com/language/translate/v2?key='+api_key
    puts uri_string


    single_line_string=" Khi ra khỏi nhà, anh ấy có mặc 1 chiếc áo đỏ và đeo một ba lô màu xanh"

    text_to_translate = <<EOS
    #{single_line_string}
EOS

    body_request = {
    "q" => text_to_translate,
    "target" => "en"}.to_json
    req_uri = URI(uri_string)

    res = Net::HTTP.post req_uri, body_request, "Content-Type" => "application/json"
    # puts res.body
    response_data = JSON.parse(res.body)
    # puts response_data["data"]["translations"][0]["translatedText"]
    # puts response_data["data"]["translations"][0]["detectedSourceLanguage"]
    return response_data
end