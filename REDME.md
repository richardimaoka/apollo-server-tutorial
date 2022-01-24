## はじめに

GraphQLを学びたいJavaScript初心者へ向けてチュートリアルを用意しました。

GraphQLにはクライアントサイドとサーバーサイドがありますが、このチュートリアルで扱うのはサーバーサイドです。

サーバーサイドGraphQLには、Apollo以外にもNexusやHasuraなどの実装もあり、どれから学び始めるか迷う人もいるかもしれません。そこで本チュートリアルは、これらを学ぶ人にも役立つ内容を意識しています。

具体的には、コピー & ペーストやクリック主体で素早くチュートリアルをこなし、GraphQLを動かす感覚をつかめるようにしています。ここでつかんだ感覚はGraphQLサーバーサイド実装を問わず通用するので、NexusやHasuraなどに学習の軸を移すか、Apolloを学び続けるかをチュートリアルが終わった後で選んでみてください。

## 開発環境セットアップ

それでは早速開発環境を整えましょう。

### GitHubレポジトリのクローン

<details><summary>:large_orange_diamond: Action: https://github.com/richardimaoka/apollo-server-tutorial へ飛んで、"Use this template"ボタンを押してください。</summary><div>

![2022-01-23_18h12_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/afd3d969-f201-0ea3-113b-ae1e928b1e4b.png)

:large_orange_diamond: Action: Repository Nameに`apollo-server-tutorial`を入力してください。

![2022-01-23_18h13_47.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/3f2e44b1-e721-295d-5e89-645a23b6f11d.png)

:large_orange_diamond: Action: Codeボタンを押して、SSHを選択し、レポジトリの名前をコピーするボタンを押してください。

![2022-01-23_18h16_09.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/17c70f2e-0e5d-3436-a896-5c5598421a06.png)

:large_orange_diamond: Action: 以下のコマンドを実行してください。`git clone`以降は直前のステップでコピーしたレポジトリ名です。

```
git clone git@github.com:{YOUR_USER_NAME}/apollo-server-tutorial.git
```

これで、自分で自由に改変してpushできるレポジトリが出来上がりました。

またcontribution graph(下画像、通称「草」)を育てやすい形にもなっています。

![2022-01-23_18h30_07.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/c2f0b0d6-68f8-6490-a39c-b0a8f83a2cf3.png)

ここまでの手順に従わず、GitHubのfork機能を使ってしまうと、自分のcontribution graphが育たないので注意してください。

> Commits will appear on your contributions graph if they meet all of the following conditions:
> 
> - ...
> - The commits were made in a standalone repository, not a fork.
> - ...
> 
> // [GitHub - Why are my contributions not showing up on my profile?](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-graphs-on-your-profile/why-are-my-contributions-not-showing-up-on-my-profile#contributions-that-are-counted)

</div></details>

### VS CodeでのDev Container機能の使用

開発環境の違いでチュートリアルが動作しない問題を避けるため、VS Code でのDev Container機能をお勧めします。お気に入りのIDEがVS Code以外の方も、このチュートリアルは練習と割り切って、VS Codeを使っていただきたいです。[^1]

[^1]: 開発環境セットアップに自信があれば、もちろんVS Code以外でもチュートリアルを実行可能なので、その場合はこのチャプターをスキップしてください。

<details><summary>:large_orange_diamond: Action: Dev Container機能を使ってGitHubからクローンしたレポジトリを開きます
</summary><div>

:large_orange_diamond: Action: [Docker Desktop](https://www.docker.com/products/docker-desktop)がインストールされていることを確認してください。

:large_orange_diamond: Action: VS Codeを開いてください

```
code apollo-server-tutorial
```

`apollo-server-tutorial`は先程GitHubからクローンしたレポジトリです。

:large_orange_diamond: Action: [Remote Development extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)がインストールされているのを確認してください。

:large_orange_diamond: Action: VSCodeで[Ctrl + P](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette)を押してください。コマンドパレットが開きます。

![2022-01-17_00h22_48.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/440af814-c205-5b10-bad5-c9c9d9261172.png "コマンドパレットが開きます。")

:large_orange_diamond: Action: コマンドパレットで”Remote Containers: Reopen in Container”を選択してください

![2022-01-24_21h05_11.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/191e8727-4f68-1df5-1083-9b6b2e6a61d8.png)

:white_check_mark: Result: これでDev Container機能を使って開発環境をセットアップできました。
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e0946a2d-5222-7f8f-6795-3db9dd173472.png)

</div></details>

### VS Code Code Tour機能の使用

CodeTourを使うと、クリックするだけでどんどんチュートリアルを進められ非常に快適なので、ぜひ一度試していただきたいです。インストールも簡単です。

(動画がいいかな？)

<details><summary>:large_orange_diamond: Action: VS CodeでCodeTourを利用する</summary><div>

先程のDEV Container機能の手順に従っていれば、すでにCodeTour利用可能になっています。

![2022-01-24_21h01_49.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/5e816241-b506-8950-1f23-e1030036f5f2.png)

:large_orange_diamond: Action: 画面左下の`instruction`から、▷印の再生ボタンを押してください。

![2022-01-24_21h57_10.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/f9079309-de41-dbbb-6e52-b7db621c83d4.png)

CodeTourを使う方は、この先はVS Code内で表示される手順に従えば、これ以降のQiita上の手順を読む必要はありません。

</div></details>

CodeTourを使わない方は、ここから先の手順を読みながらチュートリアルを進めてください。CodeTourよりは少しだけ面倒になります。

## npm packageのセットアップ

:large_orange_diamond: Action: Ctrl+`キーを押してください
:white_check_mark: Result: VS Code上でターミナルが開きます(下画像)
![2022-01-17_00h52_05.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d6c16466-72c3-ea5b-5a5e-edfe9c5546cd.png)

:large_orange_diamond: Action: ターミナルで以下のコマンドを実行してください

```
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

:white_check_mark: Result: `tsconfig.json` が生成されます

これでTypeScriptを実行する環境が整いました。次の数アクションで簡単なTypeScriptコードを実行してみます。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
cp answers/index0.ts index.ts
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

:white_check_mark: Result: コピーされたファイルは以下のとおりです。

```ts:index.ts
export const s: string = "hello world";
console.log(s);
```

TypeScriptをwatchして実行するための `ts-node-dev` を導入します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
npm install ts-node-dev
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

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

:white_check_mark: Result: 以下のように表示されます。

```console
> start
> ts-node-dev --respawn index.ts

[INFO] 14:12:04 ts-node-dev ver. 1.1.8 (using ts-node ver. 9.1.1, typescript ver. 4.5.4)
hello world
```

:large_orange_diamond: Action: 以下のようにファイルを書き換えてください。

```ts:index.ts
export const s: string = "good morning world";
```

:white_check_mark: Result: 以下のように表示されます。

```console
[INFO] 14:15:33 Restarting: /workspaces/apollo-server-tutorial/index.ts has been modified
good morning world
```

ここまでで、簡単なTypeScriptコードををwatchして実行できました。コードを書き換えたらすぐにサーバーを再起動してくれるので、apollo serverの開発が快適になります。

:large_orange_diamond: Action: 適宜 `git commit` してください。各Actionの差分がわかりやすくなります。

## apollo server のインストールと実行

:large_orange_diamond: Action: Ctrl+Cを押して、先程の`ts-node-dev`プロセスを停止してください。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
npm install apollo-server graphql
```

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
cp answers/index1.ts index.ts
```

:white_check_mark: Result: `index.ts` に最小限のapollo serverのコードをコピーしました。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
npm run start
```

:white_check_mark: Result: 以下のように表示されます。

```console
[INFO] 14:30:40 ts-node-dev ver. 1.1.8 (using ts-node ver. 9.1.1, typescript ver. 4.5.4)
🚀  Server ready at http://localhost:4000/
```

:large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

:large_orange_diamond: Action: ブラウザ上でGraph QLクエリを実行してください

![explorer-tab.jpg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/849c010b-cd68-bdf0-b726-ee4f8e9ec92b.jpeg)

<details><summary>:large_orange_diamond: 詳細な手順はこちら</summary><div>

![2022-01-18_23h31_39.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/88e31e04-4521-841c-f32d-a6c427cea962.png)

</div></details>

Apollo Studioはapollo serverの開発に欠かせないツールです。次のチャプターではGraph QLの型とともに、Apollo Studioの基本的な使い方もあわせて説明しましょう。

<details><summary>:grey_question: 実装を書いてないのに、勝手に"hello world"という文字列が返ってくるのはなぜ？( `new ApolloServer({mock: true})` の説明)</summary><div>
`ApolloServer`に`mocks: true`を渡しているため、Resolverを書かなくても"hello world"という値が返ってきます。mockの意味は次のチャプターでより明確になり、mockを使わずResolverを書いて実践的なapollo serverを開発する方法は別のチュートリアルで解説します。
</div></details>

<details><summary>:grey_question: Apollo StudioじゃなくてGraph QL Playground、もしくはGraphiQLを使いたいのだけど？</summary><div>
されないよ。という説明。
</div></details>

<details><summary>:grey_question: ドメインが `localhost` じゃなくて `https://studio.apollographql.com` だけど、勝手に外部データ送信されないの？</summary><div>
されないよ。という説明。
</div></details>

:large_orange_diamond: Action: 適宜 `git commit` してください。各Actionの差分がわかりやすくなります。

## apollo server でいくつかの型を利用してみる

:large_orange_diamond: Action: Ctrl+`を押してください。

:white_check_mark: Result: もう一つのターミナルが開きます。これは`ts-node-dev`を走らせながら別のコマンドを実行するために必要です。
![2022-01-19_00h08_47.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/dbe15293-e1c1-4a32-e22d-38f56359e666.png)

:large_orange_diamond: Action: 先程新しく開いたターミナルで、以下のコマンドを入力してください。

```
cp answers/index2.ts index.ts
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

<details><summary>:large_orange_diamond: Action: ブラウザ上でGraph QLクエリを実行してください</summary>
a
</details>

型の違いによって、mockがどのような値を自動生成してくれるか、違いがわかったと思います。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
cp answers/index3.ts index.ts
```

<details><summary>:large_orange_diamond: Action: ブラウザ上でGraph QLクエリを実行してください</summary>
a
</details>

mockはArray型のときは、要素数2のArrayを自動生成してくれます。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```
cp answers/index4.ts index.ts
```

<details><summary>:large_orange_diamond: Action: ブラウザ上でGraph QLクエリを実行してください</summary>
a
</details>

:large_orange_diamond: Action: 以下のコマンドを入力してください。

以上でGraph QLにどんあ型があるのか、基本的な部分はおさらいできました。詳しくはGraph QLのドキュメントを見てください。unionやinterfaceなど高度なものを除けば、ここまでに出てきた型だけでも実用に耐えうるアプリケーションを開発できます。

次のステップに進むには、別のチュートリアルをお勧めします。

## その他のチュートリアル

## 参考文献
