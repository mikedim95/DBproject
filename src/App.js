import { React, useState, useEffect } from "react";
import Navbar from "./components/Navbar";
import SimpleCard from "./components/SimpleCard";
import DropdownCard from "./components/DropdownCard";
import image1 from "./resources/images/image1.png";
import image2 from "./resources/images/image2.jpg";
import image3 from "./resources/images/image3.jpg";
import image4 from "./resources/images/image4.jpg";
import image5 from "./resources/images/image5.jpg";
import image6 from "./resources/images/image6.jpg";
import image7 from "./resources/images/image7.jpg";
import image8 from "./resources/images/image8.jpg";
import image9 from "./resources/images/image9.jpg";
import image10 from "./resources/images/image10.jpg";
import image11 from "./resources/images/image11.jpg";
import image12 from "./resources/images/image12.jpg";
import ResultComponent from "./components/Results";
import axios from "axios";
function App() {
  function makeTheCall(sqlQuerry) {
    console.log(sqlQuerry);
    /*  executeSQLQuery(sqlQuerry); */
  }
  /*  const executeSQLQuery = async (query) => {
    const response = await axios.post("http://localhost:3000/api/sql", {
      query: query,
    });
    setSessionComponentRender(false);
    return response.data;
  }; */
  const querry1 = "SELECT * FROM table WHERE column = ? and ?";
  const querry2 = "SELECT * FROM table WHERE column = ? and ?";
  const querry3 = "this is the 3rd querry";
  const querry4 = "this is the 4th querry";
  const querry5 = "this is the 4th querry";
  const querry6 = "this is the 4th querry";
  const querry7 = "this is the 4th querry";
  const querry8 = "this is the 4th querry";
  const querry9 = "this is the 4th querry";
  const querry10 = "this is the 4th querry";
  const querry11 = "this is the 4th querry";
  const querry12 = "this is the 4th querry";

  const nestedData = [
    {
      default: "Select Year",
      answers: ["2022", "2023"],
    },
    {
      default: "Select Month",
      answers: ["January", "February", "March", "April", "May"],
    },
  ];

  const [sessionComponentRender, setSessionComponentRender] = useState(false); // Bool for session render
  return (
    <div>
      <Navbar />
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          marginTop: "60px",
        }}
      >
        <span> Administrator Tab</span>
      </div>

      <div className="separator container">
        <DropdownCard
          image={image1} //The image to be passed to the Card child
          title={"3.1.1"}
          message={
            "List with the total number of loans per school (Search criteria: year, calendar month, e.g.January)"
          } //The message to be shown
          theCall={makeTheCall} //The function to be called up submition
          theQuerry={querry1} //The querry to be executed (passed back as argument to makeTheCall)
          //Special features (these will have dynamic impact)

          options={nestedData}
        />

        <SimpleCard
          image={image2}
          title={"3.1.2"}
          message={
            "For a given book category, which authors belong to it and which teachers have borrowed books from that category in the last year"
          }
          theQuerry={querry2}
        />
        <SimpleCard
          image={image3}
          title={"3.1.3"}
          message={
            "Find young teachers (age < 40 years) who have borrowed the most books and the number of books"
          }
          theCall={makeTheCall}
          theQuerry={querry3}
        />
        <SimpleCard
          image={image4}
          title={"3.1.4"}
          message={".Find authors whose books have not been borrowed"}
          theCall={makeTheCall}
          theQuerry={querry4}
        />
        <SimpleCard
          image={image5}
          title={"3.1.5"}
          message={
            "Which operators have loaned the same number of books in a year with more than 20 loans"
          }
          theCall={makeTheCall}
          theQuerry={querry1}
        />
        <SimpleCard
          image={image6}
          title={"3.1.6"}
          message={
            "Many books cover more than one category. Among field pairs (e.g., history and poetry) that are common in books, find the top-3 pairs that appeared in borrowings"
          }
          theCall={makeTheCall}
          theQuerry={querry1}
        />
        <SimpleCard
          image={image7}
          title={"3.1.7"}
          message={
            "Find all authors who have written at least 5 books less than the author with the most books"
          }
          theCall={makeTheCall}
          theQuerry={querry1}
        />
      </div>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          marginTop: "60px",
        }}
      >
        <span> Operator Tab</span>
      </div>

      <div className="separator container">
        <SimpleCard
          image={image8}
          title={"3.1.1"}
          message={"message1"}
          theCall={makeTheCall}
          theQuerry={querry1}
        />

        <SimpleCard
          image={image9}
          title={"3.1.1"}
          message={"message1"}
          theCall={makeTheCall}
          theQuerry={querry1}
        />
        <SimpleCard
          image={image10}
          title={"3.1.1"}
          message={"message3"}
          theCall={makeTheCall}
          theQuerry={querry3}
        />
      </div>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          marginTop: "60px",
        }}
      >
        <span> Simple User Tab</span>
      </div>

      <div className="separator container">
        <SimpleCard
          image={image11}
          title={"3.1.1"}
          message={"message1"}
          theCall={makeTheCall}
          theQuerry={querry1}
        />

        <SimpleCard
          image={image12}
          title={"3.1.1"}
          message={"message1"}
          theCall={makeTheCall}
          theQuerry={querry1}
        />
      </div>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          margin: "60px",
        }}
      >
        <span> ↓ Results Will Be Show Here ↓ </span>
      </div>
      {sessionComponentRender && (
        <ResultComponent
          /* data={sessionAnswers} */ function={CloseResultsElement}
        />
      )}
    </div>
  );

  function CloseResultsElement() {
    setSessionComponentRender(false);
  }
}
export default App;
