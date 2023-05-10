import { React, useState } from "react";
import { Card, Button, DropdownButton, Dropdown } from "react-bootstrap";
/* const theCall = {props.theCall}; */
/* debugger; */
function CardList({ image, message, theQuerry, theCall, title, options }) {
  const [choice, setChoice] = useState(Array(2));

  const handleOptionSelect = (option, index) => {
    const updatedValues = [...choice];
    updatedValues[index] = option;
    setChoice(updatedValues);
  };
  const onSubmit = () => {
    const modifiedQuery = theQuerry.replace(new RegExp("\\?", "g"), () => {
      return choice.shift();
    });
    const resetChoice = Array(choice.length).fill(undefined);
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
        <div style={{ display: "flex", justifyContent: "center" }}>
          {options.map((option, index1) => (
            <DropdownButton
              style={{ margin: "10px" }}
              key={index1}
              id="dropdown-basic-button"
              title={choice[index1] || option.default}
            >
              {option.answers.map((answer, index2) => (
                <Dropdown.Item
                  key={index2}
                  onClick={() => handleOptionSelect(answer, index1)}
                >
                  {answer}
                </Dropdown.Item>
              ))}
            </DropdownButton>
          ))}
        </div>

        <Button
          disabled={choice[0] === undefined || choice[1] === undefined}
          variant="primary"
          onClick={() => onSubmit()}
          style={{ position: "absolute", bottom: "10px" }}
        >
          Querry!
        </Button>
      </Card.Body>
    </Card>
  );
}

export default CardList;
