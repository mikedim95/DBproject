import { React, useState } from "react";
import { Card, Button, DropdownButton, Dropdown } from "react-bootstrap";
/* const theCall = {props.theCall}; */
function SimpleCard({ image, message, theCall, theQuerry, title }) {
  return (
    <Card
      style={{
        width: "18rem",
        height: "32rem",
        margin: " 5px",
        position: "relative",
      }}
    >
      <Card.Img variant="top" src={image} />
      <Card.Body>
        <Card.Title>{title}</Card.Title>
        <Card.Text>{message}</Card.Text>

        <Button
          variant="primary"
          onClick={() => theCall(theQuerry)}
          style={{ position: "absolute", bottom: "10px" }}
        >
          Querry!
        </Button>
      </Card.Body>
    </Card>
  );
}

export default SimpleCard;
