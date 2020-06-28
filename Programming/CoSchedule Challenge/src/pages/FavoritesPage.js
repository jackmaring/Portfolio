import React from "react";
import { useAuth0 } from "../react-auth0-spa";
import { Link } from "react-router-dom";

import {
  Container,
  ResultContainer,
  ResultItem,
  IsFavoriteIcon,
  ImageUsername,
  ImageWrapper,
  ResultImage,
} from "../components/Common";

function FavoritesPage(props) {
  const { user } = useAuth0();

  function renderFavorites() {
    if (user) {
      if (props.favorites && props.favorites.length) {
        // list of all the users favorites
        const userFavorites = props.favorites.filter(
          (fav) => fav.username === user.name
        );
        if (userFavorites.length && userFavorites.length) {
          return (
            <ResultContainer>
              {userFavorites.map((result) => {
                return (
                  <ResultItem key={result.id}>
                    {/* the items in the favorites page will always be favorited */}
                    <IsFavoriteIcon
                      className="fas fa-star"
                      onClick={() => props.toggleFavorite(result)}
                    />
                    <ImageUsername>{result.user}</ImageUsername>
                    <Link to={`/${result.id}`}>
                      <ImageWrapper>
                        <ResultImage
                          src={result.previewURL}
                          alt={`${result.username} image`}
                        />
                      </ImageWrapper>
                    </Link>
                  </ResultItem>
                );
              })}
            </ResultContainer>
          );
        } else {
          return (
            <div>
              <p>You have no favorites {user.nickname} :(</p>
            </div>
          );
        }
      } else {
        return (
          <div>
            <p>You have no favorites {user.nickname} :(</p>
          </div>
        );
      }
    } else {
      return (
        <div>
          <p>Log in to save your favorites!</p>
        </div>
      );
    }
  }
  return <Container>{renderFavorites()}</Container>;
}

export default FavoritesPage;
