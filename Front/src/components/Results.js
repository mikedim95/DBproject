import React from "react";
import { Table } from "react-bootstrap";
import Button from "react-bootstrap/Button";

function Results({ results, finish }) {
  return (
    <div style={{ minWidth: "400px" }}>
      <Table striped bordered hover>
        <thead>
          <tr>
            {Object.keys(results[0]).map((key, index) => (
              <th key={index}>{key}</th>
            ))}
          </tr>
        </thead>
        <tbody>
          {results.map((item, index) => (
            <tr key={index}>
              {Object.values(item).map((value, index) => (
                <td key={index}>{value}</td>
              ))}
            </tr>
          ))}
        </tbody>
      </Table>
      <Button onClick={finish}>Close</Button>
    </div>
  );
}

export default Results;
