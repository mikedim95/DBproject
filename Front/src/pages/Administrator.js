import { React, useState, useContext } from "react";
import Navbar from "../components/Navbar";
import { PropsContext } from "../resources/subroutines/PropsContext";
import image1 from "../resources/images/image1.png";
import image2 from "../resources/images/image2.jpg";
import image3 from "../resources/images/image3.jpg";
import image4 from "../resources/images/image4.jpg";
import image5 from "../resources/images/image5.jpg";
import image6 from "../resources/images/image6.jpg";
import image7 from "../resources/images/image7.jpg";
import SimpleCard from "../components/SimpleCard";
import DropdownCard from "../components/DropdownCard";
import ResultComponent from "../components/Results";
/* import axios from "axios"; */
function Administrator() {
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
    const test = "SELECT * FROM book";
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

  const querry1 =
    "SELECT school,COUNT(*) FROM lendings WHERE YEAR(date_of_rental) = ? AND  MONTH(date_of_rental) = ? GROUP BY school;";
  const querry2 =
    "SELECT lendings.person_who_received, lendings.isbn FROM lendings INNER JOIN (SELECT book.isbn FROM book INNER JOIN thematic_category_book ON book.isbn = thematic_category_book.isbn WHERE thematic_category_book.thematic_category = '?') AS T1 ON lendings.isbn = T1.isbn WHERE YEAR(lendings.date_of_rental) = 2022;";
  const querry3 =
    "SELECT  lendings.person_who_received AS name, COUNT(*) AS number_of_rentals FROM lendings INNER JOIN ( SELECT * FROM person WHERE isaTeacher = 1 AND age < 40 ) AS T1 ON lendings.person_who_received = T1.name GROUP BY lendings.person_who_received ORDER BY number_of_rentals DESC";
  const querry4 =
    "SELECT DISTINCT writer FROM WRITER_BOOK EXCEPT (SELECT DISTINCT writer_book.writer FROM writer_book INNER JOIN ( SELECT DISTINCT isbn FROM lendings ) AS T1 ON T1.isbn = writer_book.isbn);";
  const querry5 =
    "SELECT T5.person_who_received from ( SELECT lendings.person_who_received,COUNT(*) AS SUM FROM lendings INNER JOIN (SELECT name FROM credentials WHERE isaoperator = 1) AS T ON lendings.person_who_received =  T.name WHERE YEAR(lendings.date_of_rental) = 2022  GROUP BY lendings.person_who_received ) AS T5 WHERE T5.sum > 20;";
  const querry6 =
    "SELECT DISTINCT LEAST(first_thematic_category, second_thematic_category) AS first_thematic_category, GREATEST(first_thematic_category, second_thematic_category) AS second_thematic_category, sum FROM ( SELECT t3.first_thematic_category, t3.second_thematic_category, count(*) as sum FROM lendings INNER JOIN ( SELECT T1.isbn, T1.thematic_category AS first_thematic_category, T2.thematic_category AS second_thematic_category FROM thematic_category_book AS T1  INNER JOIN thematic_category_book AS T2 ON T1.isbn = T2.isbn WHERE T1.thematic_category != T2.thematic_category ) AS T3  ON lendings.isbn = T3.isbn group BY t3.first_thematic_category, t3.second_thematic_category) AS T8;";
  const querry7 =
    "SELECT T1.writer FROM (SELECT writer,COUNT(*) AS sum FROM writer_book GROUP BY writer) AS T1 WHERE T1.sum >= (SELECT COUNT(*) AS sum FROM writer_book GROUP BY writer ORDER BY sum desc limit 1) -5";
  /*---- ↓ these will be the extra instructions needed by the children to render and collect the coices  ↓ ------------------ */

  const dropdownStruct411 = [
    {
      default: "Select Year",
      answers: ["2022", "2023"],
    },
    {
      default: "Select Month",
      answers: ["1", "2", "3", "4", "5"],
    },
  ];
  const dropdownStruct412 = [
    {
      default: "Select Category",
      answers: ["Classic", "Category 2", "Category 3"],
    },
  ];
  /* const dropdownStruct416 = [
    {
      default: "Select Field 1",
      answers: ["*", "Field 2"],
    },
    {
      default: "Select Field 2",
      answers: ["Field 1", "book"],
    },
  ]; */
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
        <SimpleCard
          image={image6}
          title={"4.1.6"}
          message={
            "Many books cover more than one category. Among field pairs (e.g., history and poetry) that are common in books, find the top-3 pairs that appeared in borrowings."
          }
          theCall={makeTheCall}
          theQuerry={querry6}
          /*  options={dropdownStruct416} */
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
export default Administrator;
