import React from 'react';
import { Query } from 'react-apollo';
import { gql } from 'apollo-boost';

const UserGreeting = () => (
  <Query
    query={gql`
      {
        user {
          id
          handle
        }
      }
    `}
  >
    {({ loading, error, data }) => {
      if (loading) return 'Loading...';
      if (error) return `Error! ${error.message}`;

      return <p>Hi {data.user.handle || `#${data.user.id.slice(0, 6)}`}</p>;
    }}
  </Query>
);

export default UserGreeting;
