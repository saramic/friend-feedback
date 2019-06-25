import React from 'react';
import { Link } from '@reach/router';
import { Query } from 'react-apollo';
import { gql } from 'apollo-boost';

const GET_QUIZZES = gql`
  {
    quizzes {
      id
      title
    }
  }
`;

const Quizzes = () => (
  <Query query={GET_QUIZZES}>
    {({ loading, error, data }) => {
      if (loading) return 'Loading...';
      if (error) return `Error! ${error.message}`;

      return (
        <ul>
          {data.quizzes.map(({ id, title }) => {
            return (
              <Link to={id} key={id}>
                <div>Quiz: {title}</div>
              </Link>
            );
          })}
        </ul>
      );
    }}
  </Query>
);

export default Quizzes;
