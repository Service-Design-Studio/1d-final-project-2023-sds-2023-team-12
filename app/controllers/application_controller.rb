class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :mobile_phone, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name,:mobile_phone, :email, :password, :current_password)}
         end
         
     # Function to handle API call
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
end
