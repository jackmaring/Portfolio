import React, { useState, useEffect } from "react";
import styled from "@emotion/styled";
import { useAuth0 } from "../react-auth0-spa";
import axios from "axios";

import { Container } from "../components/Common";
import { UserComment, OtherComment } from "../components/Comment";

export const CommentsContainer = styled.div`
  position: relative;
  margin: 36px auto;
  width: 100%;
  max-width: 800px;
  height: 400px;
  overflow-y: scroll;
`;

const CommentBarStyle = styled.div`
  position: relative;
  input {
    margin: 0;
    width: 100%;
    max-width: 800px;
    padding: 12px;
    font-size: 16px;
    color: #444;
    box-sizing: border-box;
    outline: none;
    border-radius: 5px;
    border: 1px solid #444;
  }
`;

const AddIcon = styled.i`
  position: absolute;
  top: 10px;
  font-size: 24px;
  color: #555;
  right: 18px;
`;

function CommentsPage() {
  const { user } = useAuth0();

  const [query, setQuery] = useState("");
  const [messages, setMessages] = useState([]);

  //fetches data from mongodb for comments
  useEffect(() => {
    fetchComments();
  }, []);

  //calls backend to fetch data from the messages collection on mongodb
  async function fetchComments() {
    const response = await axios.get("http://localhost:5000/messages");

    setMessages(response.data);
    console.log("get request");
  }

  // handles when a user types in the comment bar
  function handleOnInputChange(event) {
    // current value of what user is typing
    const { value } = event.target;

    setQuery(value);
  }

  // handles when a user posts a comment
  function postComment(comment, user) {
    const newMessage = {
      username: user.name,
      content: comment,
    };

    // calls backend to send a post request to insert a new document into the collection
    axios.post("http://localhost:5000/messages", newMessage).then(() => {
      fetchComments();
    });

    setQuery("");
    fetchComments();
  }

  // handles when a user deletes a comment
  function deleteComment(id) {
    axios.delete("http://localhost:5000/messages/delete/" + id).then(() => {
      fetchComments();
    });

    setMessages(messages.filter((message) => message.id !== id));
  }

  // handles when a user updates a comment
  function updateComment(id) {
    // calls a pop up that allows user to input their new comment
    const editedContent = prompt("please enter new message");

    const newMessage = {
      username: user.name,
      content: editedContent,
    };

    axios
      .put("http://localhost:5000/messages/update/" + id, newMessage)
      .then(() => {
        fetchComments();
      });
  }

  // console.log(messages);

  return (
    <Container>
      <CommentsContainer>
        {messages.length ? (
          messages.map((message) => {
            // if the usernames match then a user comment is returned
            // otherwise an other comment will be returned
            return message.username === user.name ? (
              <UserComment
                key={message._id}
                username={message.username}
                content={message.content}
                deleteComment={deleteComment}
                id={message._id}
                updateComment={updateComment}
              />
            ) : (
              <OtherComment
                key={message._id}
                username={message.username}
                content={message.content}
              />
            );
          })
        ) : (
          <div>There are no comments. Make one!</div>
        )}
      </CommentsContainer>
      <CommentBarStyle htmlFor="search-input">
        <input
          name="commentBar"
          type="text"
          value={query}
          id="search-input"
          placeholder="Write a comment..."
          onChange={handleOnInputChange}
        />
        <AddIcon
          className="fas fa-plus"
          onClick={() => postComment(query, user)}
        />
      </CommentBarStyle>
    </Container>
  );
}

export default CommentsPage;
