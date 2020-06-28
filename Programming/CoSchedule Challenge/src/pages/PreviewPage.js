import React from "react";

function PreviewPage(props) {
  const resultId = props.match.params.id;
  const foundResults = props.results;
  const foundResult = foundResults.find(
    (result) => result.id.toString() === resultId.toString()
  );

  return (
    <>
      {foundResult !== null ? (
        <div>
          <img
            src={foundResult.previewURL}
            alt="dynamically generated imgage"
          />
          <p>{foundResult.id}</p>
          <p>{foundResult.user}</p>
          <p>{JSON.stringify(foundResult)}</p>
        </div>
      ) : (
        <div>Loading...</div>
      )}
    </>
  );
}

export default PreviewPage;
