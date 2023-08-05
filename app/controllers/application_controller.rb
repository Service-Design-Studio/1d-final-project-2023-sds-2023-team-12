class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

#     Set up questions for OPENAI
    def self.question_one name
     return "I have seen someone that I suspect is #{name}. What should I do?" 
    end

    def self.question_two name, special_note
     return """Given #{name}'s heath and mental condition specified:
     What is the most appropriate way to approach #{name}?""" 
    end

    def self.question_third description,name
     return """
      based on the description: '#{description}'
      , please create a photo of person with outfit that match above description, do not include any text or word in the photo""" 
    end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :mobile_phone, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name,:mobile_phone, :email, :password, :current_password)}
         end
         
#      # Function to handle API call
     def response_from_api_call single_line_string
          api_key='AIzaSyD_7AsEHBZ1zOq0ANvxwYV_7E706lhp8Xg'
          uri_string = 'https://translation.googleapis.com/language/translate/v2?key='+api_key
          puts uri_string

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
          output=Hash.new
          output[:source_language]=response_data["data"]["translations"][0]["detectedSourceLanguage"]
          output[:translatedText]=response_data["data"]["translations"][0]["translatedText"]
          return output
     end

# Function to handle API call
def response_from_api_call_test(single_line_string)
     # api_key = 'AIzaSyD_7AsEHBZ1zOq0ANvxwYV_7E706lhp8Xg'
     api_key = 'AIzaSyD_7AsEHBZ1zOq0ANvxwYV_7E706lhp8'

     uri_string = 'https://translation.googleapis.com/language/translate/v2?key=' + api_key
   
     text_to_translate = <<~EOS
       #{single_line_string}
     EOS
   
     body_request = {
       "q" => text_to_translate,
       "target" => "en"
     }.to_json
   
     req_uri = URI(uri_string)
   
     begin
       res = Net::HTTP.post(req_uri, body_request, "Content-Type" => "application/json")
       
       # Check if the API call was successful
       if res.is_a?(Net::HTTPSuccess)
         response_data = JSON.parse(res.body)
         output = Hash.new
         output[:source_language] = response_data["data"]["translations"][0]["detectedSourceLanguage"]
         output[:translatedText] = response_data["data"]["translations"][0]["translatedText"]
         return output
       else
         # Handle non-successful responses (e.g., HTTP errors like 404, 500, etc.)
         # You can raise an exception or return an appropriate error response.
         raise StandardError, "API call failed with status code: #{res.code}"
       end

     rescue StandardError => e
       # Handle any other exceptions that might occur during the API call (e.g., network errors)
       # You can log the error, send an alert, or return a user-friendly error response.
       puts "API call failed: #{e.message}"
       output = Hash.new
       output[:source_language] = "FAILED"
       output[:translatedText] = "FAILED"
       return output
     end
   end



     # Function return country name based on country code returned by user 
     def return_country_base_on_code country_code
          language_names = {
               "af" => "Afrikaans",
               "sq" => "Albanian",
               "am" => "Amharic",
               "ar" => "Arabic",
               "hy" => "Armenian",
               "az" => "Azerbaijani",
               "eu" => "Basque",
               "be" => "Belarusian",
               "bn" => "Bengali",
               "bs" => "Bosnian",
               "bg" => "Bulgarian",
               "ca" => "Catalan",
               "ceb" => "Cebuano",
               "ny" => "Chichewa",
               "zh-cn" => "Chinese (Simplified)",
               "zh-tw" => "Chinese (Traditional)",
               "co" => "Corsican",
               "hr" => "Croatian",
               "cs" => "Czech",
               "da" => "Danish",
               "nl" => "Dutch",
               "en" => "English",
               "eo" => "Esperanto",
               "et" => "Estonian",
               "tl" => "Filipino",
               "fi" => "Finnish",
               "fr" => "French",
               "fy" => "Frisian",
               "gl" => "Galician",
               "ka" => "Georgian",
               "de" => "German",
               "el" => "Greek",
               "gu" => "Gujarati",
               "ht" => "Haitian Creole",
               "ha" => "Hausa",
               "haw" => "Hawaiian",
               "iw" => "Hebrew",
               "hi" => "Hindi",
               "hmn" => "Hmong",
               "hu" => "Hungarian",
               "is" => "Icelandic",
               "ig" => "Igbo",
               "id" => "Indonesian",
               "ga" => "Irish",
               "it" => "Italian",
               "ja" => "Japanese",
               "jv" => "Javanese",
               "kn" => "Kannada",
               "kk" => "Kazakh",
               "km" => "Khmer",
               "ko" => "Korean",
               "ku" => "Kurdish (Kurmanji)",
               "ky" => "Kyrgyz",
               "lo" => "Lao",
               "la" => "Latin",
               "lv" => "Latvian",
               "lt" => "Lithuanian",
               "lb" => "Luxembourgish",
               "mk" => "Macedonian",
               "mg" => "Malagasy",
               "ms" => "Malay",
               "ml" => "Malayalam",
               "mt" => "Maltese",
               "mi" => "Maori",
               "mr" => "Marathi",
               "mn" => "Mongolian",
               "my" => "Myanmar (Burmese)",
               "ne" => "Nepali",
               "no" => "Norwegian",
               "ps" => "Pashto",
               "fa" => "Persian",
               "pl" => "Polish",
               "pt" => "Portuguese",
               "ma" => "Punjabi",
               "ro" => "Romanian",
               "ru" => "Russian",
               "sm" => "Samoan",
               "gd" => "Scots Gaelic",
               "sr" => "Serbian",
               "st" => "Sesotho",
               "sn" => "Shona",
               "sd" => "Sindhi",
               "si" => "Sinhala",
               "sk" => "Slovak",
               "sl" => "Slovenian",
               "so" => "Somali",
               "es" => "Spanish",
               "su" => "Sundanese",
               "sw" => "Swahili",
               "sv" => "Swedish",
               "tg" => "Tajik",
               "ta" => "Tamil",
               "te" => "Telugu",
               "th" => "Thai",
               "tr" => "Turkish",
               "uk" => "Ukrainian",
               "ur" => "Urdu",
               "ug" => "Uyghur",
               "uz" => "Uzbek",
               "vi" => "Vietnamese",
               "cy" => "Welsh",
               "xh" => "Xhosa",
               "yi" => "Yiddish",
               "yo" => "Yoruba",
               "zu" => "Zulu"
             }
          return language_names[country_code]
     end

     #Function to handle API call to google cloud vision microservices
     def output_google_cloud_vision_microservices
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
     end

     # Handle Open AI Api
     # def response_text_from_openai_api_call content
     #      require 'ruby/openai'
     #      client = OpenAI::Client.new
     #      response = client.chat(
     #      parameters: {
     #        model: "gpt-3.5-turbo", # Required.
     #        messages: [{ role: "user", content: content}], # Required.
     #        temperature: 0.7,
     #      })
          
     #      return response.dig("choices", 0, "message", "content")
     # end

     require 'net/http'
     require 'uri'
     require 'json'
     require 'openssl'
     
     def response_text_from_openai_api_call(description, special_note, full_name, question_number)
       if question_number == 1
         prompt = "This is a text about a missing person. If I meet someone I suspect of being this person in real life, what should I do? Make the answer very detailed and specialised to this individual, so that I can use this information. Provide a step-by-step answer."
       else
         prompt = "This is a text about a missing person. Given this person's special note, what should I do when approaching this person? Make the answer very detailed and specialised to this individual, so that I can use this information. Provide a step-by-step answer."
       end
     
       # Prepare the data to be sent in JSON format
       data = {
         "description": description,
         "special_note": special_note,
         "full_name": full_name,
         "prompt": prompt
       }
     
       # Convert the hash to a JSON string
       json_data = data.to_json
     
       flask_microservice_url = 'https://vertexai-3rguewzela-as.a.run.app/process-text'
     
       # Prepare request to the Flask microservice with HTTPS
       uri = URI(flask_microservice_url)
       http = Net::HTTP.new(uri.host, uri.port)
       http.use_ssl = true # Enable HTTPS
       http.verify_mode = OpenSSL::SSL::VERIFY_PEER # Optionally, set the SSL verification mode
     
       request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' }) #create new HTTP Post request to specific URI path
       request.body = json_data
     
       response = http.request(request)
     
       if response.is_a?(Net::HTTPSuccess)
         # The response body is in plain text, so no need to parse JSON
         result = response.body
         result # Return the generated prompt
       else
         error_message = 'Connection to Flask microservice failed'
         error_message
       end
     end
     


     #      require 'ruby/openai'
     #      client = OpenAI::Client.new
     #      response = client.chat(
     #      parameters: {
     #        model: "gpt-3.5-turbo", # Required.
     #        messages: [{ role: "user", content: content}], # Required.
     #        temperature: 0.7,
     #      })
          
     #      return response.dig("choices", 0, "message", "content")
     # end


     def response_text_edit_from_openai_api_call input,name
          require 'ruby/openai'
          client = OpenAI::Client.new
          response = client.edits(
               parameters: {
                   model: "text-davinci-edit-001",
                   input: input,
                   instruction: ApplicationController.question_two(name)
               }
           )
           return response.dig("choices", 0, "text")
     end

     def response_image_from_openai_api_call description
          require 'ruby/openai'
          client = OpenAI::Client.new
          response = client.images.generate(parameters: { prompt: description, size: "512x512" })
          return response.dig("data", 0, "url")
     end
end
