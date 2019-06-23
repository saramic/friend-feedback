import React from 'react';
import { Query } from 'react-apollo';
import { gql } from 'apollo-boost';

const Invitations = () => (
  <Query
    query={gql`
      {
        invitations {
          id
          status
        }
      }
    `}
  >
    {({ loading, error, data }) => {
      if (loading) return 'Loading...';
      if (error) return `Error! ${error.message}`;

      return (
        <ul>
          {data.invitations.map(invitation => (
            <li key={invitation.id}>
              {invitation.id} {invitation.status}
            </li>
          ))}
        </ul>
      );
    }}
  </Query>
);

export default Invitations;
