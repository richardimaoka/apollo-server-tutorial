#!/bin/sh

# ## TypeScript環境のセットアップ
#
# :large_orange_diamond: Action: ターミナルで以下のコマンドを実行してください

# ```terminal:メイン (ターミナル)
npm init -yes
# ```

# :white_check_mark: Result: `package.json` が生成されます

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
# npm install typescript
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
# npx tsc -init
# ```

# :white_check_mark: Result: ファイル `tsconfig.json` が生成されます

# これでTypeScriptをコンパイルする環境が整いました。次の数アクションで簡単なTypeScriptコードを実行してみます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
# cp answers/index0.ts index.ts
# ```

# :white_check_mark: Result: コピーされたファイルは以下のとおりです。

# ```ts:index.ts
# export const s: string = "hello world";
# console.log(s);
# ```

# TypeScriptをwatchして実行するための `ts-node-dev` を導入します。

# :large_orange_diamond: Action: 以下の一連のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
# npm install ts-node-dev
# ```

# ```terminal: メイン (ターミナル)
# npm set-script start "ts-node-dev --respawn index.ts"
# ```

# :white_check_mark: Result: `package.json`に以下が挿入されます。

# ```json:package.json
#   "scripts": {
#     "start": "ts-node-dev --respawn index.ts"
#   }
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
# npm run start
# ```

# :white_check_mark: Result: 以下のように`hello world`が表示されます。

# ```console
# > start
# > ts-node-dev --respawn index.ts

# [INFO] 14:12:04 ts-node-dev ver. 1.1.8 (using ts-node ver. 9.1.1, typescript ver. 4.5.4)
# hello world
# ```

# 次に`index.ts`の内容を書き換えると、watch機能によってリアルタイムでターミナルに反映されることを確認してみましょう。

# :large_orange_diamond: Action: 別のターミナルを新たに立ち上げてください。以下の2つのターミナルが立ち上がった状態になるはずです。

# - ターミナル1: `npm run start`を走らせ続けている状態
# - ターミナル2: 入力待ちの状態

# :large_orange_diamond: Action: 入力待ちのターミナル2で、以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
cp answers/index1.ts index.ts
# ```

# :white_check_mark: Result: 以下のようにファイルが書き換わっています。

# ```diff:index.ts
# -export const s: string = "hello world";
# +export const s: string = "good morning world";
#  console.log(s);
# ```

# :white_check_mark: Result: `npm run start`を走らせているターミナル1では、`hello world`の表示が`good morning world`に変更されます。

# ```console
# [INFO] 14:15:33 Restarting: /workspaces/apollo-server-tutorial/index.ts has been modified
# good morning world
# ```

# ここまでで、簡単なTypeScriptコードをwatchして実行できました。コードを書き換えたら、ts-node-devのwatch機能がすぐにサーバーを再起動してくれるので、apollo serverの開発が快適になります。
