import React from 'react';
import { Mutation, Query } from 'react-apollo';
import { gql } from 'apollo-boost';

const GET_INVITATIONS = gql`
  {
    invitations {
      id
      status
    }
  }
`;

const UPDATE_INVITATION = gql`
  mutation UpdateInvitation($id: ID!, $status: String!) {
    updateInvitation(id: $id, status: $status) {
      invitation {
        id
        status
      }
    }
  }
`;

const Invitation = ({ id, status }) => {
  let input;

  const onStatusSelect = ({ updateInvitation, e }) => {
    e.preventDefault();
    updateInvitation({
      variables: {
        id,
        status: input.value
      }
    });
    input.value = '';
  };

  return (
    <li>
      {id}
      <Mutation mutation={UPDATE_INVITATION} key={id}>
        {(updateInvitation, { loading, error }) => (
          <>
            <select
              ref={node => {
                input = node;
              }}
              value={status}
              onChange={e => onStatusSelect({ updateInvitation, e })}
            >
              {/* TODO can this come out of GraphQL types? */}
              <option value="pending">pending</option>
              <option value="accepted">accepted</option>
              <option value="rejected">rejected</option>
            </select>
            {loading && <p>Loading...</p>}
            {error && <p>Error :( Please try again</p>}
          </>
        )}
      </Mutation>
    </li>
  );
};

const Invitations = () => (
  <Query query={GET_INVITATIONS} pollInterval={1000}>
    {({ loading, error, data }) => {
      if (loading) return 'Loading...';
      if (error) return `Error! ${error.message}`;

      return (
        <ul>
          {data.invitations.map(({ id, status }) => {
            let input;
            return <Invitation key={id} id={id} status={status} />;
          })}
        </ul>
      );
    }}
  </Query>
);

export default Invitations;
