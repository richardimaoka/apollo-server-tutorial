import { ApolloServer, gql } from "apollo-server";

const typeDefs = gql`
  type Query {
    hello: String
    boolean: Boolean
    int: Int
    float: Float
  }
`;

const server = new ApolloServer({ typeDefs, mocks: true });

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
