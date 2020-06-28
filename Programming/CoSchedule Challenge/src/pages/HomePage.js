import React from "react";
// import axios from "axios";
import styled from "@emotion/styled";
import "../styles/styles.css";
import Loader from "../assets/loader.svg";
import { Link } from "react-router-dom";
import { useAuth0 } from "../react-auth0-spa";

import {
  Container,
  ResultContainer,
  ResultItem,
  IsFavoriteIcon,
  IsNotFavoriteIcon,
  ImageUsername,
  ImageWrapper,
  ResultImage,
  IsVoiderIcon,
  IsNotVoiderIcon,
} from "../components/Common";
// import GridItem from "../components/GridItem";
import PageNavigation from "../components/PageNavigation";

const SearchLabel = styled.label`
  position: relative;
  input {
    width: 100%;
    padding: 16px;
    font-size: 32px;
    font-style: italic;
    color: #444;
    box-sizing: border-box;
    outline: none;
    border-radius: 5px;
    border: 1px solid #444;
  }
`;

const SearchIcon = styled.i`
  position: absolute;
  top: -8px;
  font-size: 24px;
  color: #555;
  right: 18px;
`;

const LoaderWrapper = styled.img`
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;
`;

function HomePage(props) {
  const { isAuthenticated, loginWithRedirect, user } = useAuth0();

  function renderSearchResults() {
    if (props.resultsQuery.results && props.resultsQuery.results.length) {
      return (
        <ResultContainer>
          {props.resultsQuery.results.map((result) => {
            return (
              <ResultItem key={result.id}>
                {/* if the user hasn't logged in then clicking the star will redirect to login
                then whether or not the user has an item favorited will determine what icon will show */}
                {!isAuthenticated ? (
                  <IsNotFavoriteIcon
                    className="far fa-star"
                    onClick={() => loginWithRedirect({})}
                  />
                ) : props.isUserFavorite(result) ? (
                  <IsFavoriteIcon
                    className="fas fa-star"
                    onClick={() => props.toggleFavorite(result, user)}
                  />
                ) : (
                  <IsNotFavoriteIcon
                    className="far fa-star"
                    onClick={() => props.toggleFavorite(result, user)}
                  />
                )}
                {!isAuthenticated ? (
                  <IsNotVoiderIcon
                    className="fas fa-fire-alt"
                    onClick={() => loginWithRedirect({})}
                  />
                ) : props.isUserVoider(result) ? (
                  <IsVoiderIcon
                    className="fas fa-fire-alt"
                    onClick={() => props.toggleVoider(result, user)}
                  />
                ) : (
                  <IsNotVoiderIcon
                    className="fas fa-fire-alt"
                    onClick={() => props.toggleVoider(result, user)}
                  />
                )}
                <ImageUsername>{result.user}</ImageUsername>
                <Link to={`/${result.id}`}>
                  <ImageWrapper>
                    <ResultImage
                      src={result.previewURL}
                      alt={`${result.user} image`}
                    />
                  </ImageWrapper>
                </Link>
              </ResultItem>
            );
          })}
        </ResultContainer>
      );
    }
  }

  // shows prev button if the page number is over 1
  const showPrevButton = 1 < props.resultsQuery.currentPageNumber;
  // shows next button if the page number is not the last page number
  const showNextButton =
    props.resultsQuery.totalPages > props.resultsQuery.currentPageNumber;

  return (
    <Container>
      <SearchLabel htmlFor="search-input">
        <input
          name="query"
          type="text"
          value={props.query}
          id="search-input"
          placeholder="Search..."
          onChange={props.handleOnInputChange}
        />
        <SearchIcon className="fas fa-search" />
      </SearchLabel>
      {props.resultsQuery.message && <p>{props.resultsQuery.message}</p>}
      <LoaderWrapper
        src={Loader}
        className={props.resultsQuery.loading ? "show" : "hide"}
        alt="loader"
      />
      <PageNavigation
        loading={props.resultsQuery.loading}
        showPrevButton={showPrevButton}
        showNextButton={showNextButton}
        handlePrevClick={(event) => props.handlePageClick("prev", event)}
        handleNextClick={(event) => props.handlePageClick("next", event)}
      />
      {renderSearchResults()}
      <PageNavigation
        loading={props.resultsQuery.loading}
        showPrevButton={showPrevButton}
        showNextButton={showNextButton}
        handlePrevClick={(event) => props.handlePageClick("prev", event)}
        handleNextClick={(event) => props.handlePageClick("next", event)}
      />
    </Container>
  );
}

export default HomePage;
