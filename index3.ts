import { ApolloServer, gql } from "apollo-server";

const typeDefs = gql`
  type Query {
    books: Array
  }
`;

const server = new ApolloServer({ typeDefs, mocks: true });

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
