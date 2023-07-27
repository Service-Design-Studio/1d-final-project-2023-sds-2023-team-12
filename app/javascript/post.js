let response_from_server_1;
let response_from_server_2;
let response_from_server_3;

document.getElementById("fetchDataButton").addEventListener("click", fetchData);

function fetchData(post_id,question_number) {
  fetch("/post/${post_id}/question_${question_number}") // Replace with the appropriate route for your server endpoint
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response was not ok.");
      }
      return response.json();
    })
    .then((data) => {
      retrieveData(data);
    })
    .catch((error) => {
      console.error("Error fetching data:", error);
    });
}

function retrieveData(data) {
  const responseData = data.data;
  return responseData;
}

// ## Function to handle button 1
let handleQuestion=(id_box,question_number)=>{
    answer_box=document.getElementById(id_box);
    switch(question_number){
        case 1:
            answer_box=response_from_server_1;
        break;
        case 2:
            answer_box=response_from_server_2;
        break;
        case 3:
            answer_box=response_from_server_3;
        break;
    }
   
}

let after_dom_load=()=>{
    var button_one=document.getElementById("first_openai_request");
    var button_two=document.getElementById("second_openai_request");
    var button_thiree=document.getElementById("third_openai_request");

    button_one.addEventListener('click',
    function(){
        handleQuestion("first_answer_from_open_ai",1)
    });

    button_two.addEventListener('click',
    function(){
        handleQuestion("second_answer_from_open_ai",2)
    });

    button_three.addEventListener('click',
    function(){
        handleQuestion("three_answer_from_open_ai",3)
    });
   

    response_from_server_1=fetchData(<%=@post.id%>,1);
    response_from_server_2=fetchData(<%=@post.id%>,2);
    response_from_server_3=fetchData(<%=@post.id%>,3);
}

document.addEventListener("DOMContentLoaded", after_dom_load);
