import React, { useState } from "react";
import { Card, Button, Form } from "react-bootstrap";
/* const theCall = {props.theCall}; */
function SimpleCard({ image, message, theCall, theQuerry, title, options }) {
  const [choice, setChoice] = useState(Array(options.length).fill(""));
  const handleInputChange = (e, index) => {
    const updatedValues = [...choice];
    updatedValues[index] = e.target.value;
    setChoice(updatedValues);
  };
  const renderInputs = () => {
    return options.map((value, index) => (
      <Form.Control
        key={index}
        type="text"
        placeholder={value}
        value={choice[index] || ""}
        onChange={(e) => handleInputChange(e, index)}
      />
    ));
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    const modifiedQuery = theQuerry.replace(new RegExp("\\?", "g"), () => {
      return choice.shift();
    });
    const resetChoice = Array(choice.length).fill("");

    setChoice(resetChoice);
    theCall(modifiedQuery);
  };
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
        <Form onSubmit={handleSubmit}>
          <Form.Group
            className="mb-3"
            controlId="formBasicPassword"
            style={{
              display: "flex",
              justifyContent: "center",
              flexFlow: "column",
            }}
          >
            {renderInputs()}
          </Form.Group>

          <Button
            disabled={!choice.every((value) => value.trim() !== "")}
            variant="primary"
            type="submit"
            style={{ position: "absolute", bottom: "10px" }}
          >
            Query!
          </Button>
        </Form>
      </Card.Body>
    </Card>
  );
}

export default SimpleCard;
