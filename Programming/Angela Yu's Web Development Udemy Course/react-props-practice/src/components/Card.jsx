import React from "react";
import Avatar from "./Avatar";
import Detail from "./Details";

function Card(props) {
  return (
    <div>
      <h1 className="heading">My Contacts</h1>
      <div className="card">
        <div className="top">
          <p>{props.imgKey}</p>
          <h2 className="name">{props.name}</h2>
          <Avatar imgURL={props.imgURL} />
        </div>
        <div className="bottom">
          <Detail detail={props.tel} />
          <Detail detail={props.email} />
        </div>
      </div>
    </div>
  );
}

export default Card;
