#!/bin/sh

# ## Apollo Server のインストールと実行

# :large_orange_diamond: Action: 入力待ちのメインターミナルで以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
npm install apollo-server graphql
# ```

# :large_orange_diamond: Action: 続けて以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
cp answers/index2.ts index.ts
# ```

# :white_check_mark: Result: `index.ts` に最小限のApollo Serverのコードをコピーしました。

# :white_check_mark: Result: ts-node-devターミナルで、以下のように表示されます。

# ```terminal: ts-node-dev (ターミナル)
# [INFO] 14:30:40 ts-node-dev ver. 1.1.8 (using ts-node ver. 9.1.1, typescript ver. 4.5.4)
# 🚀  Server ready at http://localhost:4000/
# ```

# :large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

# :white_check_mark: Result: 以下のような画面が表示されます。

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/58dd6755-b37b-9f64-3047-a1a2e8e7b0b9.png)

# これは[The Apollo Studio Explorer](https://www.apollographql.com/docs/studio/explorer/explorer/)と呼ばれる、ブラウザからGraphQLサーバーを叩くためのツールです。

# > The Apollo Studio Explorer is a powerful web IDE for creating, running, and managing GraphQL operations:

# :large_orange_diamond: Action: 上記の画面にある、Query your serverボタンを押してください

# :white_check_mark: Result: 以下のような画面に遷移します。

# ![2022-01-25_00h35_02.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/0d0ce96f-db92-760c-801e-3cff25131d5a.png)

# :large_orange_diamond: Action: "Operation"の部分で以下のように入力し、中括弧`{}`の中でスペースキーを押してください。自動補完が効いて候補が現れます。

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/f3e998b8-685e-4b6b-a95f-010f4905daf5.png)

# :large_orange_diamond: Action: 候補から"hello"を選んで"Run"を押してください

# ![2022-01-25_00h36_07.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e1a54767-e5aa-6adf-53e9-1094323759fd.png)

# :white_check_mark: Result: "Response"の部分に"hello world"というサーバーからのレスポンスが表示されます。

# ![2022-01-25_00h36_15.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/07b28d64-adec-5674-d2c3-6b0d1a2d6572.png)

# Apollo Studio ExplorerはApolloでの開発に欠かせないツールです。次のチャプターではGraph QLの型とともに、Apollo Studio Explorerの基本的な使い方もあわせて説明しましょう。

# <details><summary>:grey_question: 実装を書いてないのに、勝手に"Hello World"という文字列が返ってくるのはなぜ？</summary><div>

# ```ts:index.ts
# const server = new ApolloServer({ typeDefs, mocks: true });
# ```
# `ApolloServer`に`mocks: true`を渡しているため、Resolverの実装を書かなくてもString型のmock値"hello world"が返ってきます。

# mockの意味は次の「Apollo Server でいくつかの型を利用してみる」を見ていただければ、より明確になります。mockを使わずResolverを書いて実践的なGraphQLサーバーを開発する方法は次のチュートリアルで解説します。

# ---

# </div></details>

# <details><summary>:grey_question: <a href="https://www.apollographql.com/docs/studio/explorer/explorer/">Apollo Studio Explorer</a>じゃなくて<a href="https://github.com/graphql/graphql-playground">Graph QL Playground</a>、もしくは<a href="https://github.com/graphql/graphiql">GraphiQL</a>を使いたいのだけど？</summary><div>

# GraphQL登場時にブラウザからGraphQLサーバーを叩く方法といえば、GraphiQLでした。

# GraphQL登場からしばらくして出てきたApolloは、GraphiQLではなくGraphQL Playgroundをデフォルトで利用している期間が長かったのですが、Apollo Server 3.0からデフォルトでApollo Studio Explorerを利用するようになりました。

# そして、GraphQL Playgroundは以下のアナウンスにある通りリタイアされ、ver 2.0が作られる予定のようです…

# - [Announcing: Playground 🤝 GraphiQL, Retiring Playground - GitHub graphql/graphql-playground issue #1143](https://github.com/graphql/graphql-playground/issues/1143)

# …でしたが、上記GitHubイシューを見ると、2021年になってからまたいくつか方針の変更があったようですね。

# なんにせよ、Apollo ServerはデフォルトでApollo Studio Explorerを利用するようになったので、このチュートリアルでもそちらを使っています。

# ---

# </div></details>

# <details><summary>:grey_question: ドメインが <code>localhost</code> じゃなくて <code>https://studio.apollographql.com</code> だけど、勝手に外部データ送信されないのですか？</summary><div>

# 一言でいうと、送信されないです。

# https://www.apollographql.com/docs/studio/explorer/sandbox/

# > Apollo Sandbox is a special instance of the Explorer that doesn't require an Apollo account. Sandbox doesn't support certain Explorer features like schema history, but it's great for local development.
# > ...中略...
# > You can use Sandbox without an internet connection if you're querying a graph running on localhost. To do so, open Sandbox in your browser at least once while connected to the internet. You can then use that browser to open Sandbox while offline.

# とはいえ、公式ドキュメントに書いてあるものの、ローカル通信しかしないのに https://studio.apollographql.com なのは、やっぱりなんだか気持ち悪いですよね。

# ---

# </div></details>
