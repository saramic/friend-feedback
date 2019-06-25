import React from 'react';
import { Query } from 'react-apollo';
import { gql } from 'apollo-boost';

const GET_QUIZ = gql`
  query Quiz($id: ID!) {
    quiz(id: $id) {
      id
      title
      organiser {
        handle
      }
      invitations {
        id
        user {
          handle
        }
      }
    }
  }
`;

const Quiz = ({ id }) => (
  <Query query={GET_QUIZ} variables={{ id }}>
    {({ loading, error, data }) => {
      if (loading) return 'Loading...';
      if (error) return `Error! ${id} ${error.message}`;

      return (
        <>
          <h2>{data.quiz.title}</h2>
          <div>
            <span>organiser: </span>
            <strong>{data.quiz.organiser.handle}</strong>
            <div>
              <strong>invitees</strong>
              <ul>
                {data.quiz.invitations.map(invitation => (
                  <li key={invitation.id}>{invitation.user.handle}</li>
                ))}
              </ul>
            </div>
          </div>
        </>
      );
    }}
  </Query>
);

export default Quiz;
