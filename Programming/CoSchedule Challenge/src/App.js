import React, { useState, useEffect } from "react";
import { Router, Route, Switch } from "react-router-dom";
import { useAuth0 } from "./react-auth0-spa";
import history from "./utils/history";
import axios from "axios";

import NavBar from "./components/NavBar";
import Header from "./components/Header";
import HomePage from "./pages/HomePage";
import FavoritesPage from "./pages/FavoritesPage";
import Profile from "./pages/Profile";
import PrivateRoute from "./components/PrivateRoute";
import PreviewPage from "./pages/PreviewPage";
import CommentsPage from "./pages/CommentsPage";
import VoidGates from "./pages/VoidGates";
import Void from "./pages/Void";
import VoidCore from "./pages/VoidCore";

function App() {
  const { loading, user } = useAuth0();

  /********************* RESULTS ***********************/

  const [query, setQuery] = useState("");
  const [resultsQuery, setResultsQuery] = useState({
    results: null,
    totalResults: 0,
    totalPages: 0,
    currentPageNumber: 0,
    loading: false,
    message: "",
  });

  // calculates the total page count of the searched results
  function getPageCount(total, denominator) {
    // disivible is a boolean that equates to true if the total can be
    // divided by the denominator without a remainder
    const divisible = 0 === total % denominator;

    // if there is a remainder then valueToBeAdded will be equal to 1
    const valueToBeAdded = divisible ? 0 : 1;

    // total and denominator are divided and any decimals are removed
    // if valueToBeAdded is 1 then 1 is added
    return Math.floor(total / denominator) + valueToBeAdded;
  }

  // fetches search results from api and updates a couple of variables
  const fetchSearchResults = async (updatedPageNo = "", query) => {
    // if this wasn't just a challenge I would find a way to hide the api key
    const apiKey = "17137260-7a1f753c10f762ce78a4eaeed";
    const pageNumber = updatedPageNo ? `&page=${updatedPageNo}` : "";
    const searchUrl = `https://pixabay.com/api/?key=${apiKey}&q=${query}${pageNumber}`;

    // saves the JSON response from api call into a variable
    const response = await axios.get(searchUrl);

    // total number of results
    const total = response.data.total;
    // calculates total number of pages
    const totalPageCount = getPageCount(total, 20);

    // if there are no more results then this message appears
    const resultNotFoundMsg = !response.data.hits.length
      ? "There are no more search results. Please try a new search"
      : "";

    setResultsQuery((prevQueryResult) => {
      return {
        ...prevQueryResult,
        results: response.data.hits,
        totalResults: totalPageCount,
        totalPages: totalPageCount,
        currentPageNumber: updatedPageNo,
        loading: false,
        message: resultNotFoundMsg,
      };
    });
  };

  // handles when the user types in the search bar
  function handleOnInputChange(event) {
    // the current value of what is in the search bar
    const { value } = event.target;

    setQuery(value);

    // while fetching the data loading is true
    setResultsQuery((prevQueryResult) => {
      return {
        ...prevQueryResult,
        loading: true,
        message: "",
      };
    });

    fetchSearchResults(1, value);
  }

  // handles when a user clicks on either the next or prev buttons
  function handlePageClick(type, event) {
    event.preventDefault();

    // if the prev button is pressed then the updatedPageNo will
    // be the currentPageNumber -1 otherwise it will be +1
    const updatedPageNo =
      "prev" === type
        ? resultsQuery.currentPageNumber - 1
        : resultsQuery.currentPageNumber + 1;

    setResultsQuery((prevQueryResult) => {
      return {
        ...prevQueryResult,
        currentPageNumber: updatedPageNo,
      };
    });

    // if it's not alrady loading then it set loading to true
    if (!resultsQuery.loading) {
      setResultsQuery((prevQueryResult) => {
        return {
          ...prevQueryResult,
          loading: true,
          message: "",
        };
      });

      // data is fetched with the updated page and current query
      fetchSearchResults(updatedPageNo, query);
    }
  }

  /********************* FAVORITES ***********************/

  const [favorites, setFavorites] = useState(null);

  //calls backend to fetch data from the favorites collection on mongodb
  async function fetchFavorites() {
    const response = await axios.get("http://localhost:5000/favorites");

    setFavorites(response.data);
  }

  // return true if item is in favorites
  function isFavorite(result) {
    if (favorites.find((fav) => fav.id.toString() === result.id.toString())) {
      return true;
    }
  }

  // returns true if user has favorited item
  function isUserFavorite(result) {
    // find list of user favorites
    const userFavorites = favorites.filter((fav) => fav.username === user.name);
    if (
      userFavorites.find((fav) => fav.id.toString() === result.id.toString())
    ) {
      return true;
    }
  }

  // either favorites or unfavorites item
  function toggleFavorite(result, user) {
    if (isFavorite(result)) {
      // goes through list of favorites to find where the ids match
      favorites.forEach((fav) => {
        if (fav.id.toString() === result.id.toString()) {
          // removes favorite
          axios
            .delete("http://localhost:5000/favorites/" + fav._id)
            .then(() => {
              fetchFavorites();
            });
          setFavorites(favorites.filter((fav) => fav.id !== result.id));
        }
      });
    } else {
      const newFavorite = {
        id: result.id,
        previewURL: result.previewURL,
        user: result.user,
        username: user.name,
      };
      // creates new favorite
      axios.post("http://localhost:5000/favorites", newFavorite).then(() => {
        fetchFavorites();
      });
    }
  }

  /********************* VOIDERZ ***********************/

  const [voiderz, setVoiderz] = useState(null);

  //calls backend to fetch data from the voiderz collection on mongodb
  async function fetchVoiderz() {
    const response = await axios.get("http://localhost:5000/voiderz");

    setVoiderz(response.data);
  }

  // return true if item is in voiderz
  function isVoider(result) {
    if (voiderz.find((fav) => fav.id.toString() === result.id.toString())) {
      return true;
    }
  }

  // returns true if user has item in V O I D
  function isUserVoider(result) {
    // find list of user favorites
    const userVoiderz = voiderz.filter((fav) => fav.username === user.name);
    if (userVoiderz.find((fav) => fav.id.toString() === result.id.toString())) {
      return true;
    }
  }

  // either sends item to or saves item from the V O I D
  function toggleVoider(result, user) {
    if (isVoider(result)) {
      // goes through list of voiderz to find where the ids match
      voiderz.forEach((voider) => {
        if (voider.id.toString() === result.id.toString()) {
          // removes voider
          axios
            .delete("http://localhost:5000/voiderz/" + voider._id)
            .then(() => {
              fetchVoiderz();
            });
          setVoiderz(voiderz.filter((voider) => voider.id !== result.id));
        }
      });
    } else {
      const newVoider = {
        id: result.id,
        previewURL: result.previewURL,
        user: result.user,
        username: user.name,
      };
      // creates new favorite
      axios.post("http://localhost:5000/voiderz", newVoider).then(() => {
        fetchVoiderz();
      });
    }
  }

  //fetches data from mongodb for favorites and voiderz
  useEffect(() => {
    fetchFavorites();
    fetchVoiderz();
  }, []);

  // if auth0 returns that it's loading then it will say that
  // it's loading before rendering the component
  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <Router history={history}>
      <NavBar />
      <Header />
      <Switch>
        <Route
          path="/"
          exact
          render={(props) => (
            <HomePage
              {...props}
              query={query}
              resultsQuery={resultsQuery}
              handleOnInputChange={handleOnInputChange}
              handlePageClick={handlePageClick}
              toggleFavorite={toggleFavorite}
              isUserFavorite={isUserFavorite}
              toggleVoider={toggleVoider}
              isUserVoider={isUserVoider}
            />
          )}
        />
        <Route
          path="/favorites"
          render={(props) => (
            <FavoritesPage
              {...props}
              favorites={favorites}
              toggleFavorite={toggleFavorite}
              isFavorite={isFavorite}
            />
          )}
        />
        <PrivateRoute path="/profile" component={Profile} />
        <PrivateRoute path="/comments" component={CommentsPage} />
        <PrivateRoute path="/void-gates" component={VoidGates} />
        <PrivateRoute path="/void" component={Void} />
        <PrivateRoute
          path="/void-core"
          render={(props) => (
            <VoidCore
              {...props}
              voiderz={voiderz}
              toggleVoider={toggleVoider}
            />
          )}
        />
        <Route
          path="/:id"
          render={(props) => (
            <PreviewPage {...props} results={resultsQuery.results} />
          )}
        />
        <Route
          path="/:id"
          render={(props) => <PreviewPage {...props} results={favorites} />}
        />
      </Switch>
    </Router>
  );
}

export default App;
