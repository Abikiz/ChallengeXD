
//code to connect the API and analize data 
const dataApiXdigital = async () => {
    try {
      //1.connection with the link
      //getting the data from the API with fetch
      const res = await fetch(
        "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow"
      );
      //translating the data of the result of res
      const data = await res.json();
      //DOM manipulation to the first question.
      document.getElementById("res1").innerHTML = `
        1. Connection with API is sucessful!
      </div>`;
  
      //2.number of questions asnwered and not asnwered
      //array based on the questions aswered
      const questionAnswered = data.items.filter((n) => n.is_answered === true);
      //array based on the questions not asnwered
      const questionNotAnswered = data.items.filter(
        (n) => n.is_answered === false
      );
      //DOM manipulation to the second question
      document.getElementById("res2").innerHTML = `
      <div>
        2. The total of the questions answered is <b>${questionAnswered.length}</b> and the total of the questions not answered is <b>${questionNotAnswered.length}</b>
      </div>`;
  
      //3. the asnwer with the highest owners
      //array based on the answer_count
      const owners = data.items.map((n) => n.answer_count);
      //filter to get the answer with the highest owners
      const answerHighestOwners = data.items.filter(
        (n) => n.answer_count === Math.max(...owners)
      );
      //DOM manipulation to the third question
      document.getElementById("res3").innerHTML = `
      <div>
        3. The question with the highest owners: <b>${
          answerHighestOwners[0].title
        } </b> with <b>${Math.max(...owners)} </b> owners in the asnwer
      </div>`;
  
      //4. The question with the lower number of viewers
      //array based on the view_count of each question
      const questionLowerViewers = data.items.map((n) => n.view_count);
      //filter of the result of questionLowerViewer array for get the question with the lower number of viewers
      const question = data.items.filter(
        (n) => n.view_count === Math.min(...questionLowerViewers)
      );
      //DOM manipulation to the fourth question
      document.getElementById("res4").innerHTML = `
      <div>
        4. The question with the lowers viewer is: <b>${
          question[0].title
        } </b> with <b>${Math.min(...questionLowerViewers)} </b> viewers
      </div>`;
  
      //5. the oldest and newer date asnwer
      //array based on the creation_date of the answer
      const date = data.items.map((n) => n.creation_date);
      //filter of the older question
      const questionOlder = data.items.filter(
        (n) => n.creation_date === Math.min(...date)
      );
      //filter of the newer question
      const questionNewer = data.items.filter(
        (n) => n.creation_date === Math.max(...date)
      );
      //DOM manipulation to the fifth question
      document.getElementById("res5").innerHTML = `
      <div>
        5. The older question is: <b>${
          questionOlder[0].title
        } </b> with a creation date on <b>${Math.min(
        ...date
      )}</b>, and the newer question is: <b>${
        questionNewer[0].title
      } </b> with a creation date on <b>${Math.max(...date)} </b> 
      </div>`;
  
      // 6. console log view of the first five questions of the challenge
      //first question
      console.log("1. Connection with API is sucessful!");
      //second question
      console.log(
        `2. The total of the questions answered is ${questionAnswered.length} and the total of the questions not answered is ${questionNotAnswered.length}`
      );
      //third question
      console.log(
        `3. The question with the highest owners:${
          answerHighestOwners[0].title
        } with${Math.max(...owners)}owners in the asnwer`
      );
      //fourth question
      console.log(
        `4. The question with the lowers viewer is: ${
          question[0].title
        } with ${Math.min(...questionLowerViewers)} viewers`
      );
      //fifth question
      console.log(
        `5. The older question is: ${
          questionOlder[0].title
        } with a creation date on ${Math.min(
          ...date
        )}, and the newer question is: ${
          questionNewer[0].title
        } with a creation date on ${Math.max(...date)}`
      );
      document.getElementById("res6").innerHTML = `
      <div>
        6. Hey look in the console to see the asnwers of the question above 
      </div>`;

    } catch (error) {
      //In the case the API is not able to connect
      document.getElementById("res1").innerHTML = `
      <h1>I'm sorry XD!</h1>
      <div>
        The API that you guys gave me is not able to connect with my challenge :C
        <a href="https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow" target="_blank" rel="noopener noreferrer">API unable to connect</a>.
      </div>`;
    }
  };

//use de funtion
dataApiXdigital();