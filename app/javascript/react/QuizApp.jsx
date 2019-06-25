import React from 'react';
import { Router, Link } from '@reach/router';
import { ApolloProvider } from 'react-apollo';
import ApolloClient from '../api/ApolloClient';
import { signOut } from '../api/clearnace';
import UserGreeting from './UserGreeting';
import Invitations from './Invitations';
import Quizzes from './Quizzes';

const QuizApp = () => (
  <ApolloProvider client={ApolloClient}>
    <div>Quizz App</div>
    <ul>
      <li>
        <Link to="invitations">invitations</Link>
      </li>
      <li>
        <Link to="quizzes">quizzes</Link>
      </li>
    </ul>
    <Router>
      <Invitations path="invitations" />
      <Quizzes path="quizzes" />
    </Router>
    <UserGreeting />
    <button onClick={signOut}>sign out</button>
  </ApolloProvider>
);

export default QuizApp;
