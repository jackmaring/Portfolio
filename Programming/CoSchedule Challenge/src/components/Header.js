import React from "react";
import { Link } from "react-router-dom";
import styled from "@emotion/styled";
import { useAuth0 } from "../react-auth0-spa";

const HeadingStyle = styled.div`
  text-align: center;
  h2 {
    font-size: 48px;
    padding: 32px 0;
  }
  p {
    display: inline-block;
    padding: 10px 32px;
    text-decoration: none;
    color: #333;
    font-size: 16px;
  }
  p:hover {
    color: #ffa371;
  }
`;

function Header() {
  const { isAuthenticated } = useAuth0();

  return (
    <HeadingStyle>
      <h2>CoSchedule Coding Challenge</h2>
      <Link to="/">
        <p>Home</p>
      </Link>
      <Link to="/favorites">
        <p>Favorites</p>
      </Link>
      {/* only shows if logged in */}
      {isAuthenticated && (
        <Link to="/comments">
          <p>Comments</p>
        </Link>
      )}
      {/* only shows if logged in */}
      {isAuthenticated && (
        <Link to="/profile">
          <p>Profile</p>
        </Link>
      )}
      {/* only shows if logged in */}
      {isAuthenticated && (
        <Link to="/void-gates">
          <p>DO NOT CLICK THIS BUTTON <span role="img" aria-label="evil smile emojis">😈😈😈</span></p>
        </Link>
      )}
    </HeadingStyle>
  );
}

export default Header;
