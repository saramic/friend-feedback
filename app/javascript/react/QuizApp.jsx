import React from 'react';
import { ApolloProvider } from 'react-apollo';
import ApolloClient from '../api/ApolloClient';
import { signOut } from '../api/clearnace';
import UserGreeting from './UserGreeting';
import Invitations from './Invitations';

const QuizApp = () => (
  <ApolloProvider client={ApolloClient}>
    <div>Quizz App</div>
    <UserGreeting />
    <button onClick={signOut}>sign out</button>
    <Invitations />
  </ApolloProvider>
);

export default QuizApp;
