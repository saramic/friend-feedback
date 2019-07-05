import React from "react";
import { Link } from "@reach/router";
import { Query } from "react-apollo";
import { gql } from "apollo-boost";

const GET_INCOMPLETE_QUIZZES = gql`
  {
    incompleteQuizzes {
      id
      title
    }
  }
`;

const IncompleteQuizzes = () => (
  <Query query={GET_INCOMPLETE_QUIZZES}>
    {({ loading, error, data }) => {
      if (loading) return "Loading...";
      if (error) return `Error! ${error.message}`;

      return (
        <ul>
          {data.incompleteQuizzes.map(({ id, title }) => {
            return (
              <a href={`/admin/quizzes/${id}/edit`} key={id}>
                <div>Quiz: {title}</div>
              </a>
            );
          })}
        </ul>
      );
    }}
  </Query>
);

export default IncompleteQuizzes;
