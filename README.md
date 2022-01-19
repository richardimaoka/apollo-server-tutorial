## GitHubレポジトリのクローン

:large_orange_diamond: Action: 以下のコマンドを実行してください

```
git clone https://github.com/richardimaoka/apollo-server-tutorial.git
```

<details><summary>:large_orange_diamond: Action: (Optional) GitHub草を育てたい方は、git remoteを書き換えてください</summary>

## (Optional) VS Code Dev Container機能の使用

開発環境の違いによってチュートリアルが動作しない問題を避けるため、VS Code + Dev Container機能の使用をお勧めします。お気に入りのIDEがVS Code以外の方も、このチュートリアルを進める間だけは練習と割り切って、VS Codeを使っていただきたいです。

開発環境セットアップに自身があれば、もちろんVS Code以外でもチュートリアルを実行可能なので、その場合は次のチャプターまでスキップしてください。

:large_orange_diamond: Action: VS Codeを開いてください

```
code apollo-server-tutorial
```

<details><summary>:large_orange_diamond: Action: VS CodeのRemote Containersコマンドで、開発環境をreopenしてください</summary><div>

VSCodeで[Ctrl + P](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette)を押してください。コマンドパレットが開きます。
![2022-01-17_00h22_48.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/440af814-c205-5b10-bad5-c9c9d9261172.png "コマンドパレットが開きます。")

コマンドパレットで”Remote Containers: Clone Repository in Container Volume”を選択してください
![2022-01-17_00h23_23.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a315f4ab-2ff3-aa04-de0a-18b1b1dba4e0.png)

GitHubを選択してください
![2022-01-17_00h23_42.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/f889a33a-7466-85c4-9717-bb5c5914a892.png)

richardomaka/apollo-server-tutorialを選択してください
![2022-01-17_00h24_29.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1714679c-1fb5-9bc5-14c5-abed0d671339.png)

mainを選択してください
![2022-01-17_00h45_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/8801e9da-e1df-2e5a-3eea-30515aab57f2.png)

---

</div></details>

これでDev Container機能を使って、[richardimaoka/apollo-server-tutorial](https://github.com/richardimaoka/apollo-server-tutorial)開発環境をセットアップできました。
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/e0946a2d-5222-7f8f-6795-3db9dd173472.png)

<details><summary>ディレクトリ構成はこのようになっています。</summary><div>

```
/workspaces/apollo/server-tutorial
  |- .devcontaienr
  |    |- devcontainer.json
  |    |- Dockerfile
  |- answers
  |    |- .gitignore
  |    |- index0.ts
  |    |- index1.ts
  |    |- ...
  |    |- package-lock.json
  |    |- package.json
  |    |- tsconfig.json
  |- .gitignore
```

</div></details>

## npm packageのセットアップ

:large_orange_diamond: Action: Ctrl+`キーを押してください
:white_check_mark: Result: VS Code上でターミナルが開きます(下画像)
![2022-01-17_00h52_05.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d6c16466-72c3-ea5b-5a5e-edfe9c5546cd.png)

:large_orange_diamond: Action: ターミナルで以下のコマンドを実行してください

```
npm init –yes
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

:white_check_mark: :white_check_mark: Result: コピーされたファイルは以下のとおりです。

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

こここまでで、簡単なTypeScriptコードををwatchして実行できました。コードを書き換えたらすぐにサーバーを再起動してくれるので、apollo serverの開発が快適になります。

## apollo server のインストール

npm install apollo-server graphql

show resulting file structure and files

cp answers/index1.ts index.ts
//barebone apollo server with mocked hello world

//show the file content

