import os
import openai
from flask import Flask, jsonify, request
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# initilalise Flask app
app = Flask(__name__)

# set openai key from env variable
openai.api_key = os.getenv("OPENAI_API_KEY")

# define api endpoint and functionality
@app.route('/process-text', methods=['POST'])
def process_text():
    # get text data from request body
    data =  request.data.decode('utf-8')

    response = openai.Completion.create(
        model = "text-davinci-003",
        prompt = generate_prompt(data),
        max_tokens = 300 # tokens result in how long we want the generated result to be. 1 token about 4 char
    )
    result = response.choices[0].text.strip() # this is mainly for postman, not sure how or what datatype to return as for future
    return jsonify({"result": result})


# define prompt for ai, this will be called above, concatonate text from description and speical note with prompt
def generate_prompt(text_data):
    prompt = "This is a text about a missing person. Extract keywords from this text that are important relevant information to the individual. From the physical appearance, clothing, any mental issues, etc. Separate them with commas. {}".format(text_data)
    return prompt

if __name__ == '__main__':
    app.run(debug=True)