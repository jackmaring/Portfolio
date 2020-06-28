import React from "react";
import { useAuth0 } from "../react-auth0-spa";
import styled from "@emotion/styled";

const NavBarStyle = styled.div`
  display: flex;
  justify-content: flex-end;
  margin: 16px;
`;

const LoginLogoutButton = styled.button`
  color: #555;
  text-decoration: none;
  border: 1px solid #898989;
  padding: 10px 20px;
  margin-right: 10px;
  border-radius: 5px;
`;

const NavBar = () => {
  const { isAuthenticated, loginWithRedirect, logout } = useAuth0();

  return (
    <NavBarStyle>
      {/* if the user isn't logged in then it shows log in button */}
      {!isAuthenticated && (
        <LoginLogoutButton onClick={() => loginWithRedirect({})}>Log in</LoginLogoutButton>
      )}
      {/* if the user is logged in then it shows the log out button */}
      {isAuthenticated && <LoginLogoutButton onClick={() => logout()}>Log out</LoginLogoutButton>}
    </NavBarStyle>
  );
};

export default NavBar;
