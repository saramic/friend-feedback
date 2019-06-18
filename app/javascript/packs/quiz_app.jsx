import React from 'react';
import ReactDOM from 'react-dom';
import QuizApp from '../react/QuizApp';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <QuizApp />,
    document.body.appendChild(document.createElement('div'))
  );
});
