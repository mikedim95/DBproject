import { React, useState, useContext } from "react";
import Navbar from "../components/Navbar";
import { PropsContext } from "../resources/subroutines/PropsContext";
import SimpleCard from "../components/SimpleCard";
import image11 from "../resources/images/image11.jpg";
import image12 from "../resources/images/image12.jpg";
import ResultComponent from "../components/Results";
import FormCard from "../components/FormCard";
/* import axios from "axios"; */
function App() {
  const [showAlert, setShowAlert] = useState(false);
  const { props } = useContext(PropsContext);
  const { username, password } = props;
  console.log(username, password);
  const [message, setMessage] = useState(false);
  const [resultRender, setResultRender] = useState(false);
  const [result, setResult] = useState(); // Bool for Results render (not allways visible)
  const showCreditsAllert = (data) => {
    setMessage(data.message);
    setShowAlert(true);
    const timer = setTimeout(() => {
      setShowAlert(false);
    }, 5000);
  };
  async function makeTheCall(sqlQuery) {
    //This function is finalyl called by the children with the sqlQuerry ready as argument
    console.log(sqlQuery);
    try {
      const response = await fetch("http://localhost:4000/private/query", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          sqlQuery,
          username,
          password,
          role: "Operator",
        }),
      });

      if (response.ok) {
        const data = await response.json();

        // Handle the response from the backend
        console.log(data);
        setResult(data); // Modify this to perform the desired action
        setResultRender(true);
      } else {
        const data = await response.json().error;
        console.log(data);
        /* showCreditsAllert({ error });
        console.error("Error:", error); */
        throw new Error("Request failed with status: " /* + response.json() */);
      }
    } catch (error) {
      showCreditsAllert({ error });
      console.error("Error:", error);
    }
  }
  function CloseResultsElement() {
    setResultRender(false);
  }

  // ------- ↓ These are the the sqlQuerries. The '?' will be replaced with the user choices by the childer with Regex

  const querry11 =
    "SELECT book.title, thematic_category.thematic_category, writer.writer  FROM book  JOIN writer_book ON book.isbn = writer_book.isbn  JOIN writer ON writer_book.writer = writer.writer  JOIN thematic_category_book ON book.isbn = thematic_category_book.isbn  JOIN thematic_category ON thematic_category_book.thematic_category = thematic_category.thematic_category;";
  const querry12 =
    "SELECT book.title  FROM lendings  JOIN book ON lendings.isbn = book.isbn  WHERE lendings.person_who_received = '?'; ";

  /*---- ↓ these will be the extra instructions needed by the children to render and collect the coices  ↓ ------------------ */

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
        <span> Simple User Tab</span>
      </div>

      <div className="separator container">
        <SimpleCard
          image={image11}
          title={"4.3.1"}
          message={
            "List with all books (Search criteria: title/category/author), ability to select a book and create a reservation request)."
          }
          theCall={makeTheCall}
          theQuerry={querry11}
        />

        <FormCard
          image={image12}
          title={"4.3.2"}
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
        <ResultComponent results={result} function={CloseResultsElement} />
      )}
    </div>
  );

  function CloseResultsElement() {
    setResultRender(false);
  }
}
export default App;
