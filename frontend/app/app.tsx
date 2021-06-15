import React, { useState } from "react";
import { useQuery, gql } from '@apollo/client';

import "./app.css";

const ALL_FRIENDS = gql`
  query GetAllFriends {
    allFriends {
        id
        firstName
        lastName
    }
}
`;

export default function App() {
    const { loading, error, data } = useQuery(ALL_FRIENDS);

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error :(</p>;

    return (
        <>
            <h1 className="blue">django + graphene + react + apollo client</h1>
            <p>First, add a superuser in the IDE Shell using: ./manage.py createsuperuser</p>
            <p>Then, log in at <a href="/admin">/admin</a>. Add a friend to the database.</p>
            <p>After you add a friend, refresh this page!</p>
            <p>You may also wish to use <a href="/graphql">graphiql</a> to debug your GraphQL.</p>
            <p>my friends, loaded with GraphQL:</p>
            <ul>
                {data.allFriends.map(({ id, firstName, lastName }) => (
                    <li key={id}>
                        {lastName}, {firstName}
                    </li>
                ))}
            </ul>
        </>
    );
}
