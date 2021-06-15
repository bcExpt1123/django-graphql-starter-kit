import React from "react";
import ReactDOM from "react-dom";
import { ApolloClient, InMemoryCache } from '@apollo/client';
import { ApolloProvider } from '@apollo/client/react';

import App from "./app/app";
import "normalize.css";


const client = new ApolloClient({
    uri: '/graphql',
    cache: new InMemoryCache()
});

ReactDOM.render(
    <React.StrictMode>
        <ApolloProvider client={client}>
            <App />
        </ApolloProvider>
    </React.StrictMode>,
    document.getElementById("root")
);
