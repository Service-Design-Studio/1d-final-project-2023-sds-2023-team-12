require 'uri'
require 'net/http'
require 'json'

api_key = ENV['API_KEY']
uri_string = 'https://vision.googleapis.com/v1/images:annotate?key='+api_key
puts uri_string
gs_uri = "gs://examples-images-ruby-api/sign.jpg"

body_request = {
    "requests" => [
        {
          "image" => {
            "source" => {
                "gcsImageUri" =>  gs_uri
            }
          },
          "features" => [
            {
              "type" => "TEXT_DETECTION",
              "maxResults" => 10
            }
          ]
        }
    ]
}.to_json

req_uri = URI(uri_string)
res = Net::HTTP.post req_uri, body_request, "Content-Type" => "application/json"
#puts res.body
response_data = JSON.parse(res.body)
puts response_data['responses'][0]["textAnnotations"][0]['description']