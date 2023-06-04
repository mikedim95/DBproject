import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import "./index.css";
import { PropsProvider } from "./resources/subroutines/PropsContext";
import LoginPage from "./pages/LoginPage";
import App from "./pages/App";
import Administrator from "./pages/Administrator";
import Operator from "./pages/Operator";
import User from "./pages/User";
import reportWebVitals from "./reportWebVitals";
import "bootstrap/dist/css/bootstrap.min.css";
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <PropsProvider>
        <Routes>
          <Route path="/LoginPage" element={<LoginPage />} />
          <Route path="*" element={<Navigate to="/LoginPage" />} />
          <Route path="/Administrator" element={<Administrator />} />
          <Route path="/Operator" element={<Operator />} />
          <Route path="/User" element={<User />} />
          <Route path="/App" element={<App />} />
        </Routes>
      </PropsProvider>
    </BrowserRouter>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
