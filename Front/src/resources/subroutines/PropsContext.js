import React, { createContext, useState } from "react";

export const PropsContext = createContext();

export const PropsProvider = ({ children }) => {
  const [props, setProps] = useState({});

  return (
    <PropsContext.Provider value={{ props, setProps }}>
      {children}
    </PropsContext.Provider>
  );
};
