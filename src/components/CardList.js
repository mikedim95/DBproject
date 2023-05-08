import React from "react";
import { Card, Button } from "react-bootstrap";
/* const theCall = {props.theCall}; */
function CardList({ image, message, theCall, theQuerry }) {
  console.log(theCall);
  return (
    <Card style={{ width: "18rem", height: "32rem", margin: " 5px" }}>
      <Card.Img variant="top" src={image} />
      <Card.Body>
        <Card.Title>Card 1</Card.Title>
        <Card.Text>{message}</Card.Text>
        <Button variant="primary" onClick={() => theCall(theQuerry)}>
          Go somewhere
        </Button>
      </Card.Body>
    </Card>
  );
}

export default CardList;
