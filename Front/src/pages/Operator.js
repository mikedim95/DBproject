import { React, useState, useContext } from "react";
import Navbar from "../components/Navbar";
import { PropsContext } from "../resources/subroutines/PropsContext";
import image8 from "../resources/images/image8.jpg";
import image9 from "../resources/images/image9.jpg";
import image10 from "../resources/images/image10.jpg";
import ResultComponent from "../components/Results";
import FormCard from "../components/FormCard";
import Alert from "react-bootstrap/Alert";
import SimpleCard from "../components/SimpleCard";
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

  const querry8 =
    "SELECT DISTINCT book.title, writer.writer, num_of_copies.num_of_copies  FROM book  LEFT JOIN writer_book ON book.isbn = writer_book.isbn   LEFT JOIN writer ON writer_book.writer = writer.writer  LEFT JOIN num_of_copies ON book.isbn = num_of_copies.isbn  WHERE writer.writer = '?' and book.title='?'";
  const querry9 =
    "SELECT DISTINCT lendings.person_who_received, person.name  FROM lendings  JOIN person ON lendings.person_who_received = person.name  WHERE lendings.date_of_return IS NULL  AND lendings.date_to_be_returned < CURRENT_DATE; ";
  const querry10 =
    "SELECT lendings.person_who_received, thematic_category.thematic_category, AVG(book_ratings.rating) AS average_rating FROM lendings JOIN book ON lendings.isbn = book.isbn JOIN thematic_category_book ON book.isbn = thematic_category_book.isbn JOIN thematic_category ON thematic_category_book.thematic_category = thematic_category.thematic_category JOIN book_ratings ON book.isbn = book_ratings.isbn WHERE lendings.person_who_received = 'Όνομα_Χρήστη' AND thematic_category.thematic_category = 'Κατηγορία' GROUP BY lendings.person_who_received, thematic_category.thematic_category ";
  /*---- ↓ these will be the extra instructions needed by the children to render and collect the coices  ↓ ------------------ */

  const optionsArray421 = ["Author", "Title"];

  const optionsArray423 = ["User", "Category"];
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

        <SimpleCard
          image={image9}
          title={"4.2.2"}
          message={
            "Find all borrowers who own at least one book and have delayed its return. (Search criteria: First Name, Last Name, Delay Days)."
          }
          theCall={makeTheCall}
          theQuerry={querry9}
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
      {showAlert && (
        <Alert
          variant="warning"
          onClose={() => setShowAlert(false)}
          dismissible
        >
          {message}
        </Alert>
      )}
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          margin: "60px",
        }}
      >
        <span> ↓ Results Will Be Show Here ↓ </span>
      </div>
      <div>
        {resultRender && (
          <ResultComponent results={result} function={CloseResultsElement} />
        )}
      </div>
    </div>
  );
}
export default App;
