## はじめに

GraphQL を学びたい JavaScript 初心者へ向けてチュートリアルを用意しました。利用する GraphQL ライブラリは[Apollo](https://www.apollographql.com/docs/apollo-server/)です。

理解の前に「動かす感覚」を味わってもらうため、**ほぼ全てコピー&ペーストのみで**、素早く進められるチュートリアルになっています。

<details><summary>:grey_question: Apolloではなく、先にNexusやHasuraなど他のサーバーサイドGraphQL技術を学ぶか迷っているのですが？</summary>

GraphQL にはクライアントサイドとサーバーサイドがありますが、このチュートリアルで扱うのはサーバーサイドです。

サーバーサイド GraphQL には、Apollo 以外にも[Nexus](https://nexusjs.org/)や[Hasura](https://hasura.io/blog/tagged/javascript/)などの実装もあり、どれから学び始めるか迷う人もいるかもしれません。そういった方のためにも、チュートリアルに少し工夫を施しました。

本チュートリアルと、それに続く一連のチュートリアルは、ほぼ全てコピー&ペーストのみで素早く進められるように作られています。時間がない方でも「GraphQL を動かす感覚」をつかんでいただけるように構成しており、その感覚は Apollo であっても、Nexus や Hasura であっても、実装技術の詳細を問わず、GraphQL 全般に通用するものになっています。

チュートリアルに沿って、ある程度 Apollo Server を学んだあとで、そのまま Apollo Server を学び続けるか、Nexus や Hasura などに学習の軸を移すか選んでみてください。

---

</details>

<details><summary>:grey_question: <a href="https://www.apollographql.com/docs/apollo-server/getting-started/">公式のApollo ServerドキュメントにGet startedページ</a>があるので、そちらを見ればいいのではないですか？</summary>

たしかに本チュートリアル単体を見れば、公式の Get started と大差はありません。

しかし、本チュートリアルとそれに続く一連のチュートリアルを通して学んで頂くと、ほぼ全てコピー&ペーストのみで素早く進められるという工夫の積み重ねで、より快適に学んでいただけると考えています。

その他の公式 Get started ページと差異は

- TypeScript を前提にしている
- TypeScript を watch して走らせる ts-node-dev を使い、以降のチュートリアルも快適にこなすための土台にしている
- 敢えて丁寧な説明はせず、理解するよりも先に動かす感覚をつかんでもらう構成にしている

といったところです。

一連のチュートリアルを学んで GraphQL を動かす感覚をつかんでもらえたら、その後 Apollo の公式チュートリアルで学び直すのもおすすめです。最初から Apollo 公式チュートリアルだけで学ぶより、そのほうが早くなるように工夫してチュートリアルを構成しています。

---
## gitレポジトリのクローン

:large_orange_diamond: Action: ターミナルで以下の一連のコマンドを実行してください

```
git clone https://github.com/richardimaoka/apollo-server-tutorial.git
cd apollo-server-tutorial
```

## TypeScript環境のセットアップ
#
:large_orange_diamond: Action: ターミナルで以下のコマンドを実行してください

```terminal:メイン (ターミナル)
npm init -yes
```

:white_check_mark: Result: `package.json` が生成されます

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
npm install typescript
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
npx tsc -init
```

:white_check_mark: Result: ファイル `tsconfig.json` が生成されます

これでTypeScriptをコンパイルする環境が整いました。次の数アクションで簡単なTypeScriptコードを実行してみます。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
cp answers/index0.ts index.ts
```

:white_check_mark: Result: コピーされたファイルは以下のとおりです。

```ts:index.ts
export const s: string = "hello world";
console.log(s);
```

TypeScriptをwatchして実行するための `ts-node-dev` を導入します。

:large_orange_diamond: Action: 以下の一連のコマンドを入力してください。

```terminal: メイン (ターミナル)
npm install ts-node-dev
```

```terminal: メイン (ターミナル)
npm set-script start "ts-node-dev --respawn index.ts"
```

:white_check_mark: Result: `package.json`に以下が挿入されます。

```json:package.json
  "scripts": {
    "start": "ts-node-dev --respawn index.ts"
  }
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
npm run start
```

:white_check_mark: Result: 以下のように`hello world`が表示されます。

```console
> start
> ts-node-dev --respawn index.ts

[INFO] 14:12:04 ts-node-dev ver. 1.1.8 (using ts-node ver. 9.1.1, typescript ver. 4.5.4)
hello world
```

次に`index.ts`の内容を書き換えると、watch機能によってリアルタイムでターミナルに反映されることを確認してみましょう。

:large_orange_diamond: Action: 別のターミナルを新たに立ち上げてください。以下の2つのターミナルが立ち上がった状態になるはずです。

- ターミナル1: `npm run start`を走らせ続けている状態
- ターミナル2: 入力待ちの状態

:large_orange_diamond: Action: 入力待ちのターミナル2で、以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
cp answers/index1.ts index.ts
```

:white_check_mark: Result: 以下のようにファイルが書き換わっています。

```diff:index.ts
-export const s: string = "hello world";
+export const s: string = "good morning world";
 console.log(s);
```

:white_check_mark: Result: `npm run start`を走らせているターミナル1では、`hello world`の表示が`good morning world`に変更されます。

```console
[INFO] 14:15:33 Restarting: /workspaces/apollo-server-tutorial/index.ts has been modified
good morning world
```

ここまでで、簡単なTypeScriptコードをwatchして実行できました。コードを書き換えたら、ts-node-devのwatch機能がすぐにサーバーを再起動してくれるので、apollo serverの開発が快適になります。

## apollo server のインストールと実行

ここまでの手順に沿っていれば、以下の2つのターミナルを立ち上げているはずです。

- ターミナル1: `npm run start`を走らせ続けている状態
- ターミナル2: 入力待ちの状態

:large_orange_diamond: Action: 入力待ちのターミナル2で以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
npm install apollo-server graphql
```

:large_orange_diamond: Action: 続けて以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
cp answers/index2.ts index.ts
```

:white_check_mark: Result: `index.ts` に最小限のapollo serverのコードをコピーしました。

:white_check_mark: Result: `npm run start`を走らせ続けているーミナル1で、以下のように表示されます。

```console
[INFO] 14:30:40 ts-node-dev ver. 1.1.8 (using ts-node ver. 9.1.1, typescript ver. 4.5.4)
🚀  Server ready at http://localhost:4000/
```

:large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

:white_check_mark: Result: 以下のような画面が表示されます。

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/58dd6755-b37b-9f64-3047-a1a2e8e7b0b9.png)

これは[The Apollo Studio Explorer](https://www.apollographql.com/docs/studio/explorer/explorer/)と呼ばれる、ブラウザからGraphQLサーバーを叩くためのツールです。

> The Apollo Studio Explorer is a powerful web IDE for creating, running, and managing GraphQL operations:

:large_orange_diamond: Action: 上記の画面にある、Query your serverボタンを押してください

:white_check_mark: Result: 以下のような画面に遷移します。

![2022-01-25_00h35_02.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/0d0ce96f-db92-760c-801e-3cff25131d5a.png)

:large_orange_diamond: Action: "Operation"の部分で以下のように入力し、中括弧`{}`の中でスペースキーを押してください。自動補完が効いて候補が現れます。

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/f3e998b8-685e-4b6b-a95f-010f4905daf5.png)

:large_orange_diamond: Action: 候補から"hello"を選んで"Run"を押してください

![2022-01-25_00h36_07.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e1a54767-e5aa-6adf-53e9-1094323759fd.png)

:white_check_mark: Result: "Response"の部分に"hello world"というサーバーからのレスポンスが表示されます。

![2022-01-25_00h36_15.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/07b28d64-adec-5674-d2c3-6b0d1a2d6572.png)

Apollo Studioはapollo serverの開発に欠かせないツールです。次のチャプターではGraph QLの型とともに、Apollo Studioの基本的な使い方もあわせて説明しましょう。

<details><summary>:grey_question: 実装を書いてないのに、勝手に"Hello World"という文字列が返ってくるのはなぜ？</summary><div>

```ts:index.ts
const server = new ApolloServer({ typeDefs, mocks: true });
```
`ApolloServer`に`mocks: true`を渡しているため、Resolverの実装を書かなくてもString型のmock値"hello world"が返ってきます。

mockの意味は次の「Apollo Server でいくつかの型を利用してみる」を見ていただければ、より明確になります。mockを使わずResolverを書いて実践的なGraphQLサーバーを開発する方法は次のチュートリアルで解説します。
</div></details>

<details><summary>:grey_question: <a href="https://www.apollographql.com/docs/studio/explorer/explorer/">Apollo Studio Explorer</a>じゃなくて<a href="https://github.com/graphql/graphql-playground">Graph QL Playground</a>、もしくは<a href="https://github.com/graphql/graphiql">GraphiQL</a>を使いたいのだけど？</summary><div>

GraphQL登場時にブラウザからGraphQLサーバーを叩く方法といえば、GraphiQLでした。

GraphQL登場からしばらくして出てきたApolloは、GraphiQLではなくGraphQL Playgroundをデフォルトで利用している期間が長かったのですが、Apollo Server 3.0からデフォルトでApollo Studio Explorerを利用するようになりました。

そして、GraphQL Playgroundは以下のアナウンスにある通りリタイアされ、ver 2.0が作られる予定のようです…

- [Announcing: Playground 🤝 GraphiQL, Retiring Playground - GitHub graphql/graphql-playground issue #1143](https://github.com/graphql/graphql-playground/issues/1143)

…でしたが、上記GitHubイシューを見ると、2021年になってからまたいくつか方針の変更があったようですね。

なんにせよ、Apollo ServerはデフォルトでApollo Studio Explorerを利用するようになったので、このチュートリアルでもそちらを使っています。

</div></details>

<details><summary>:grey_question: ドメインが <code>localhost</code> じゃなくて <code>https://studio.apollographql.com</code> だけど、勝手に外部データ送信されないのですか？</summary><div>

一言でいうと、送信されないです。

https://www.apollographql.com/docs/studio/explorer/sandbox/

> Apollo Sandbox is a special instance of the Explorer that doesn't require an Apollo account. Sandbox doesn't support certain Explorer features like schema history, but it's great for local development.
> ...中略...
> You can use Sandbox without an internet connection if you're querying a graph running on localhost. To do so, open Sandbox in your browser at least once while connected to the internet. You can then use that browser to open Sandbox while offline.

とはいえ、公式ドキュメントに書いてあるものの、ローカル通信しかしないのに https://studio.apollographql.com なのは、やっぱりなんだか気持ち悪いですよね。

---


## Apollo Server でいくつかの型を利用してみる

再掲ですが、ここまでの手順に沿っていれば、以下の2つのターミナルを立ち上げているはずです。

- ターミナル1: `npm run start`を走らせ続けている状態
- ターミナル2: 入力待ちの状態

:large_orange_diamond: Action: ターミナル2で、以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
cp answers/index3.ts index.ts
```

:white_check_mark: Result: いくつかの型が追加されました。

```diff:index.ts
const typeDefs = gql`
  type Query {
    hello: String
>   booleanValue: Boolean
>   intValue: Int
>   floatValue: Float
  }
 `;
```

:large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

![2022-01-26_23h46_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/98d0e41c-2d7b-ec1e-39c5-f523151092ef.png)

:white_check_mark: Result: 先ほどと同じ手順で、今度は`hello`以外に、`booleanValue`, `floatValue`, `intValue`という新たな候補が現れているはずです。

:large_orange_diamond: Action: 以下のクエリを"Operation"の部分に入力して、"Run"ボタンを押してください。

```graphql
{
  hello
  booleanValue
  floatValue
  intValue
}
```

:white_check_mark: Result: このような結果が返されます。

![2022-01-26_23h49_43.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/6ffedafe-4396-4698-c63f-b6d0db352697.png)

:large_orange_diamond: Action: ターミナル2で、以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
cp answers/index4.ts index.ts
```

:large_orange_diamond: Action: クエリに`arrayOfInts`を追加してください。

![2022-01-26_23h50_50.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/70250d4c-eaaf-d746-6cf7-2d74f11e99e3.png)

:white_check_mark: Result: このような結果が返されます。

![2022-01-26_23h51_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a781fcde-5c6e-60ad-9ad7-7c314299ce61.png)

ApolloServerのmockは、Array型に対して要素数2のArrayを自動生成してくれます。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```terminal: メイン (ターミナル)
cp answers/index5.ts index.ts
```

:large_orange_diamond: Action: クエリに`arrayOfObjs`を入力してください。

![2022-01-26_23h54_59.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d6f9c4b7-99c3-3e7b-bc6a-4a2ab0aebb01.png)

:white_check_mark: Result: このようなエラーが返されます。

![2022-01-26_23h59_09.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d6b92c0e-b1b7-cb35-2f9c-7dc8aca546c9.png)

このエラーがなぜ起こるかというと、GraphQLのクエリ文法ではオブジェクト型のフィールドに対して、以下のような入れ子型のクエリを書かなくてはならないからです。

:large_orange_diamond: Action: 以下のようにクエリを書き換えてください。


```graphql
{
  arrayOfObjs {
    id
    intValue
    floatValue
  }
}
```

:large_orange_diamond: Action: "Run"ボタンを押してください

![2022-01-26_23h51_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a781fcde-5c6e-60ad-9ad7-7c314299ce61.png)

:white_check_mark: Result: このような結果が返されます。

![2022-01-27_00h02_08.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/812a97ac-95f5-6ef0-0af0-fd874d8bb803.png)
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
