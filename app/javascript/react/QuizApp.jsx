import React from "react";
import { Router, Link } from "@reach/router";
import { ApolloProvider } from "react-apollo";
import ApolloClient from "../api/ApolloClient";
import { signOut } from "../api/clearnace";
import UserGreeting from "./UserGreeting";
import Invitations from "./Invitations";
import Quizzes from "./Quizzes";
import IncompleteQuizzes from "./IncompleteQuizzes";
import Quiz from "./Quiz";

const QuizApp = () => (
  <ApolloProvider client={ApolloClient}>
    <div>Quizz App</div>
    <UserGreeting />
    <ul>
      <li>
        <a href="/admin">admin</a>
      </li>
      <li>
        <Link to="invitations">invitations</Link>
      </li>
      <li>
        <Link to="quizzes">quizzes</Link>
      </li>
      <li>
        <Link to="incompleteQuizzes">incomplete quizzes</Link>
      </li>
    </ul>
    <Router>
      <Invitations path="invitations" />
      <Quizzes path="quizzes" />
      <Quiz path="quizzes/:id" />
      <IncompleteQuizzes path="incompleteQuizzes" />
    </Router>
    <button onClick={signOut}>sign out</button>
  </ApolloProvider>
);

export default QuizApp;
