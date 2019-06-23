const xCsrfToken = () =>
  /<meta name="csrf-token" content="(.*)">/.exec(document.head.innerHTML)[1];

const signOut = () => {
  fetch('/sign_out', {
    method: 'DELETE',
    headers: {
      'Content-type': 'application/json',
      Accept: 'application/json'
    },
    body: JSON.stringify({
      authenticity_token: cCxrfToken()
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

export { signOut, xCsrfToken };
