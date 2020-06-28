import React from "react";
import styled from "@emotion/styled";
import "../styles/styles.css";

const NavContainer = styled.div`
  margin: 20px 0;
  display: flex;
  justify-content: flex-end;
`;

const NavLink = styled.a`
  color: #555;
  text-decoration: none;
  border: 1px solid #898989;
  padding: 10px 20px;
  margin-right: 10px;
  border-radius: 5px;
`;

function PageNavigation(props) {
  return (
    <NavContainer>
      {/* prev button */}
      <NavLink
        href="#"
        className={`${props.showPrevButton ? "show" : "hide"} ${
          props.loading ? "grayed-out" : ""
        }`}
        onClick={props.handlePrevClick}
      >
        Prev
      </NavLink>
      {/* next button */}
      <NavLink
        href="#"
        className={props.showNextButton ? "show" : "hide"}
        onClick={props.handleNextClick}
      >
        Next
      </NavLink>
    </NavContainer>
  );
}

export default PageNavigation;
