import { ApolloServer, gql } from "apollo-server";

const typeDefs = gql`
  type Query {
    hello: String
    booleanValue: Boolean
    intValue: Int
    floatValue: Float

    arrayOfInts: [Int]
    books: [Book]
  }

  type Book {
    title: String
    author: String
  }
`;

const books = [
  {
    title: 'The Awakening',
    author: 'Kate Chopin',
  },
  {
    title: 'City of Glass',
    author: 'Paul Auster',
  },
];

const resolvers = {
  Query: {
    hello(parent: any, args: any, context: any, info: any): string { 
      return "hello universe!";
    },
    booleanValue(parent: any, args: any, context: any, info: any): boolean { 
      return true;
    },
    intValue(parent: any, args: any, context: any, info: any): number { 
      return 3;
    },
    floatValue(parent: any, args: any, context: any, info: any): number { 
      return 30.5;
    },
    arrayOfInts(parent: any, args: any, context: any, info: any): number[] { 
      return [1,2,3,4,5];
    },
    books(parent: any, args: any, context: any, info: any): Object[] { 
      return books;
    },
  }
}

const server = new ApolloServer({ typeDefs, resolvers });

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
