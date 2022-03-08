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

```
npm install typescript
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
npx tsc -init
```

:white_check_mark: Result: ファイル `tsconfig.json` が生成されます

これでTypeScriptをコンパイルする環境が整いました。次の数アクションで簡単なTypeScriptコードを実行してみます。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
cp answers/index0.ts index.ts
```

:white_check_mark: Result: コピーされたファイルは以下のとおりです。

```ts:index.ts
export const s: string = "hello world";
console.log(s);
```

TypeScriptをwatchして実行するための `ts-node-dev` を導入します。

:large_orange_diamond: Action: 以下の一連のコマンドを入力してください。

```
npm install ts-node-dev
```

```
npm set-script start "ts-node-dev --respawn index.ts"
```

:white_check_mark: Result: `package.json`に以下が挿入されます。

```json:package.json
  "scripts": {
    "start": "ts-node-dev --respawn index.ts"
  }
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
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

```
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
