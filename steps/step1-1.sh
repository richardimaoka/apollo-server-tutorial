#!/bin/sh

# ## TypeScript環境のセットアップ

# :large_orange_diamond: Action: ターミナルで以下のコマンドを実行してください。

# ```terminal:メイン (ターミナル)
npm init -yes
# ```

# :white_check_mark: Result: `package.json` が生成されます

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
npm install typescript
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
npx tsc -init
# ```

# :white_check_mark: Result: ファイル `tsconfig.json` が生成されます

# これでTypeScriptをコンパイルする環境が整いました。次の数アクションで簡単なTypeScriptコードを実行してみます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
cp answers/index0.ts index.ts
# ```

# :white_check_mark: Result: コピーされたファイルは以下のとおりです。

# ```ts:index.ts
# export const s: string = "hello world";
# console.log(s);
# ```

# TypeScriptをwatchして実行するための `ts-node-dev` を導入します。

# :large_orange_diamond: Action: 以下の一連のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
npm install ts-node-dev
npm set-script start "ts-node-dev --respawn index.ts"
# ```

# :white_check_mark: Result: `package.json`に以下が挿入されます。

# ```json:package.json
#   "scripts": {
#     "start": "ts-node-dev --respawn index.ts"
#   }
# ```
