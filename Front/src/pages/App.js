import { React, useState } from "react";
import Navbar from "../components/Navbar";

import image1 from "../resources/images/image1.png";
import image2 from "../resources/images/image2.jpg";
import image3 from "../resources/images/image3.jpg";
import image4 from "../resources/images/image4.jpg";
import image5 from "../resources/images/image5.jpg";
import image6 from "../resources/images/image6.jpg";
import image7 from "../resources/images/image7.jpg";
import image8 from "../resources/images/image8.jpg";
import image9 from "../resources/images/image9.jpg";
import image10 from "../resources/images/image10.jpg";
import image11 from "../resources/images/image11.jpg";
import image12 from "../resources/images/image12.jpg";
import SimpleCard from "../components/SimpleCard";
import DropdownCard from "../components/DropdownCard";
import ResultComponent from "../components/Results";
import FormCard from "../components/FormCard";
/* import axios from "axios"; */
function App() {
  const [resultRender, setResultRender] = useState(false); // Bool for Results render (not allways visible)
  function makeTheCall(sqlQuerry) {
    //This function is finalyl called by the children with the sqlQuerry ready as argument
    console.log(sqlQuerry);
    /*  executeSQLQuery(sqlQuerry); */
  }
  /*  const executeSQLQuery = async (query) => {
    const response = await axios.post("http://localhost:3000/api/sql", {
      query: query,
    });
    setResultRender(false);
    return response.data;
  }; */

  // ------- ↓ These are the the sqlQuerries. The '?' will be replaced with the user choices by the childer with Regex

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

  /*---- ↓ these will be the extra instructions needed by the children to render and collect the coices  ↓ ------------------ */

  const dropdownStruct411 = [
    {
      default: "Select Year",
      answers: ["2022", "2023"],
    },
    {
      default: "Select Month",
      answers: ["January", "February", "March", "April", "May"],
    },
  ];
  const dropdownStruct412 = [
    {
      default: "Select Category",
      answers: ["Category 1", "Category 2", "Category 3"],
    },
  ];
  const dropdownStruct416 = [
    {
      default: "Select Field 1",
      answers: ["Field 1", "Field 2"],
    },
    {
      default: "Select Field 2",
      answers: ["Field 1", "Field 2"],
    },
  ];
  const optionsArray421 = ["Title", "Category", "Author", "Copies"];
  const optionsArray422 = ["First Name", "Last Name", "Delay Days"];
  const optionsArray423 = ["User", "Category"];
  const optionsArray431 = ["Title", "Category", "Author"];
  const optionsArray432 = ["User"];
  /*----------------------------- ↓ Begin Rendering -------------------------------------------
  (General Idea: Render the children unconditionally and pass props. DropdownCards and FormCards require extra props)
  In the end, conditionally render the Results from the queries*/
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
          title={"4.1.1"}
          message={
            "List with the total number of loans per school (Search criteria: year, calendar month, e.g.January)."
          } //The message to be shown
          theCall={makeTheCall} //The function to be called up submition
          theQuerry={querry1} //The querry to be executed (passed back as argument to makeTheCall)
          //Special features (these will have dynamic impact)

          options={dropdownStruct411}
        />

        <DropdownCard
          image={image2}
          title={"4.1.2"}
          message={
            "For a given book category, which authors belong to it and which teachers have borrowed books from that category in the last year."
          }
          theQuerry={querry2}
          theCall={makeTheCall}
          options={dropdownStruct412}
        />
        <SimpleCard
          image={image3}
          title={"4.1.3"}
          message={
            "Find young teachers (age < 40 years) who have borrowed the most books and the number of books."
          }
          theCall={makeTheCall}
          theQuerry={querry3}
        />
        <SimpleCard
          image={image4}
          title={"4.1.4"}
          message={"Find authors whose books have not been borrowed."}
          theCall={makeTheCall}
          theQuerry={querry4}
        />
        <SimpleCard
          image={image5}
          title={"4.1.5"}
          message={
            "Which operators have loaned the same number of books in a year with more than 20 loans."
          }
          theCall={makeTheCall}
          theQuerry={querry5}
        />
        <DropdownCard
          image={image6}
          title={"4.1.6"}
          message={
            "Many books cover more than one category. Among field pairs (e.g., history and poetry) that are common in books, find the top-3 pairs that appeared in borrowings."
          }
          theCall={makeTheCall}
          theQuerry={querry6}
          options={dropdownStruct416}
        />
        <SimpleCard
          image={image7}
          title={"4.1.7"}
          message={
            "Find all authors who have written at least 5 books less than the author with the most books."
          }
          theCall={makeTheCall}
          theQuerry={querry7}
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
        <FormCard
          image={image8}
          title={"4.2.1"}
          message={
            "All books by Title, Author (Search criteria: title/ category/ author/ copies)."
          }
          theCall={makeTheCall}
          theQuerry={querry8}
          options={optionsArray421}
        />

        <FormCard
          image={image9}
          title={"4.2.2"}
          message={
            "Find all borrowers who own at least one book and have delayed its return. (Search criteria: First Name, Last Name, Delay Days)."
          }
          theCall={makeTheCall}
          theQuerry={querry9}
          options={optionsArray422}
        />
        <FormCard
          image={image10}
          title={"4.2.3"}
          message={
            "Average Ratings per borrower and category (Search criteria: user/category)."
          }
          theCall={makeTheCall}
          theQuerry={querry10}
          options={optionsArray423}
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
        <FormCard
          image={image11}
          title={"4.3.1"}
          message={
            "List with all books (Search criteria: title/category/author), ability to select a book and create a reservation request)."
          }
          theCall={makeTheCall}
          theQuerry={querry11}
          options={optionsArray431}
        />

        <FormCard
          image={image12}
          title={"4.2.1"}
          message={"List of all books borrowed by this user."}
          theCall={makeTheCall}
          theQuerry={querry12}
          options={optionsArray432}
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
      {resultRender && (
        <ResultComponent
          /* data={sessionAnswers} */ function={CloseResultsElement}
        />
      )}
    </div>
  );

  function CloseResultsElement() {
    setResultRender(false);
  }
}
export default App;
