import React from "react";
import Card from "./Card";
import contacts from "../contacts";

function createCard(contact) {
  return (
    <Card
      key={contact.id}
      imgKey={contact.id}
      name={contact.name}
      imgURL={contact.imgURL}
      tel={contact.phone}
      email={contact.email}
    />
  );
}

function App() {
  return (
    <div>
      {contacts.map(createCard)}
    </div>
  );
}

export default App;
