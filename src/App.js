import React from "react";
import Navbar from "./components/Navbar";
import CardList from "./components/CardList";
import image1 from "./resources/images/image1.png";
import image2 from "./resources/images/image2.jpg";
import image3 from "./resources/images/image3.jpg";
import image4 from "./resources/images/image4.jpg";
import axios from "axios";
function makeTheCall(sqlQuerry) {
  console.log(sqlQuerry);
  /* executeSQLQuery(sqlQuerry); */
}
const executeSQLQuery = async (query) => {
  const response = await axios.post("http://localhost:3000/api/sql", {
    query: query,
  });
  return response.data;
};
const querry1 = "this is the 1st querry";
const querry2 = "this is the 2nd querry";
const querry3 = "this is the 3rd querry";
const querry4 = "this is the 4th querry";
function App() {
  return (
    <div>
      <Navbar />

      <div
        className="container"
        style={{
          display: "flex",
          flexDirection: "row",
          flexWrap: "wrap",
          justifyContent: "center",
        }}
      >
        <CardList
          image={image1}
          message={"message1"}
          theCall={makeTheCall}
          theQuerry={querry1}
        />
        <CardList
          image={image2}
          message={"message2"}
          theCall={makeTheCall}
          theQuerry={querry2}
        />
        <CardList
          image={image3}
          message={"message3"}
          theCall={makeTheCall}
          theQuerry={querry3}
        />
        <CardList
          image={image4}
          message={"message4"}
          theCall={makeTheCall}
          theQuerry={querry4}
        />
      </div>
    </div>
  );
}

export default App;
