import React, { useState, useContext } from "react";
import "./LoginPage.css";
import { PropsContext } from "../resources/subroutines/PropsContext";
import { useNavigate } from "react-router-dom";
const LoginPage = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const navigate = useNavigate();
  const { setProps } = useContext(PropsContext);

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(username, password);
    // Send the login request to the backend
    fetch("http://localhost:4000/auth/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username, password }),
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle the response from the backend
        if (data.redirectUrl) {
          setProps({ username, password });
          navigate(data.redirectUrl);
          // Append the username and password as query parameters
          /*   const redirectUrlWithParams =
            data.redirectUrl +
            `?username=${encodeURIComponent(
              username
            )}&password=${encodeURIComponent(password)}`;
          window.location.href = redirectUrlWithParams; // Redirect to the specified URL with parameters
     */
        } else {
          // Handle login failure
          console.log("Login failed");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  };

  return (
    <div className="login-container">
      <h1>Login Page</h1>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="username">Username:</label>
          <input
            type="text"
            id="username"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </div>
        <div className="form-group">
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <button type="submit">Submit</button>
      </form>
    </div>
  );
};

export default LoginPage;
