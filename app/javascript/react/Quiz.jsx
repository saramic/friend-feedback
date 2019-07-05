import React from "react";
import { Mutation, Query } from "react-apollo";
import { gql } from "apollo-boost";
import _ from "lodash";

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
      questions {
        id
        text
      }
      questionsQuizzes {
        questionId
        votes {
          status
        }
      }
    }
  }
`;

const VOTE_ON_QUESTION = gql`
  mutation VoteOnQuestion($quizId: ID!, $questionId: ID!, $status: Int!) {
    voteOnQuestion(quizId: $quizId, questionId: $questionId, status: $status) {
      vote {
        status
      }
    }
  }
`;

const Question = ({ quizId, question, questionsQuiz }) => {
  let voteStatus =
    questionsQuiz &&
    questionsQuiz.votes[0] &&
    parseInt(questionsQuiz.votes[0].status, 10);

  const onVoteClick = ({ voteOnQuestion, event }) => {
    event.preventDefault();
    voteStatus = parseInt(event.target.dataset.status, 10);
    voteOnQuestion({
      variables: {
        quizId: event.target.dataset.quizId,
        questionId: event.target.dataset.questionId,
        status: voteStatus // should use event.target.value?
      }
    });
  };

  return (
    <li>
      {question.text}
      <Mutation mutation={VOTE_ON_QUESTION}>
        {(voteOnQuestion, { loading, error }) => (
          <>
            {typeof voteStatus != "undefined" ? (
              <>{voteStatus === 0 ? "👍" : "👎"}</>
            ) : (
              <>
                <a
                  data-quiz-id={quizId}
                  data-question-id={question.id}
                  data-status={0}
                  onClick={event => onVoteClick({ voteOnQuestion, event })}
                >
                  👍
                </a>
                <a
                  data-quiz-id={quizId}
                  data-question-id={question.id}
                  data-status={1}
                  onClick={event => onVoteClick({ voteOnQuestion, event })}
                >
                  👎
                </a>
                {loading && <p>Loading...</p>}
                {error && <p>Error :( Please try again</p>}
              </>
            )}
          </>
        )}
      </Mutation>
    </li>
  );
};

const Quiz = ({ id }) => {
  return (
    <Query query={GET_QUIZ} variables={{ id }}>
      {({ loading, error, data }) => {
        if (loading) return "Loading...";
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
              <div>
                <strong>questions</strong>
                <ul>
                  {data.quiz.questions.map(question => {
                    const questionsQuiz = _.find(
                      data.quiz.questionsQuizzes,
                      questionsQuiz => questionsQuiz.questionId === question.id
                    );
                    return (
                      <Question
                        quizId={id}
                        question={question}
                        questionsQuiz={questionsQuiz}
                        key={question.id}
                      />
                    );
                  })}
                </ul>
              </div>
            </div>
          </>
        );
      }}
    </Query>
  );
};

export default Quiz;
