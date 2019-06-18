import React from 'react';

const signOut = () => {
  fetch('/sign_out', {
    method: 'DELETE',
    headers: {
      'Content-type': 'application/json',
      Accept: 'application/json'
    },
    body: JSON.stringify({
      authenticity_token: /<meta name="csrf-token" content="(.*)">/.exec(
        document.head.innerHTML
      )[1]
    })
  })
    .then(response => {
      if (response.ok) {
        return response;
      } else if (response.redirected) {
        window.location.assign(response.url);
      } else {
        throw new Error(`Request rejected with status ${response.status}`);
      }
    })
    .then(response => response.json())
    .then(response => {
      console.log(response);
    })
    .catch(error => {
      console.log(error);
    });
};

const QuizApp = () => (
  <>
    <div>Quizz App</div>
    <button onClick={signOut}>sign out</button>
  </>
);

export default QuizApp;
