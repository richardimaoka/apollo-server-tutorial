## まとめ

以上が Apollo Server を立ち上げて、簡単なクエリをブラウザから実行するまでの流れを紹介しました。

今回は以下のように `mocks: true` を指定した最小限のサーバー実装でしたが、

```ts
const server = new ApolloServer({ typeDefs, mocks: true });
```

モックを使わない実際の GraphQL サーバー開発では、各フィールドの[Resolver](https://www.apollographql.com/docs/apollo-server/data/resolvers/)を書く必要があります。次のチュートリアルでは Resolver の書き方を紹介します。

## 次のチュートリアル

Apollo Server Resolver (準備中)

## 参考資料

- Apollo Basics 公式 https://www.apollographql.com/docs/
- Apollo Server 公式 https://www.apollographql.com/docs/apollo-server/
- GraphQL 公式 https://graphql.org/
- How to GraphQL https://www.howtographql.com/
