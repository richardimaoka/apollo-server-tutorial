#!/bin/sh

# 次に`index.ts`の内容を書き換えると、watch機能によってリアルタイムでターミナルに反映されることを確認してみましょう。

# :large_orange_diamond: Action: メインのターミナルで、以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
cp answers/index1.ts index.ts
# ```

# :white_check_mark: Result: 以下のようにファイルが書き換わっています。

# ```diff:index.ts
# -export const s: string = "hello world";
# +export const s: string = "good morning world";
#  console.log(s);
# ```

# :white_check_mark: Result: `npm run start` を走らせているts-node-dev ターミナルでは、`hello world`の表示が`good morning world`に変更されます。

# ```terminal: ts-node-dev (ターミナル)
# [INFO] 14:15:33 Restarting: /workspaces/apollo-server-tutorial/index.ts has been modified
# good morning world
# ```

# ここまでで、簡単なTypeScriptコードをwatchして実行できました。コードを書き換えたら、ts-node-devのwatch機能がすぐにサーバーを再起動してくれるので、Apollo Serverでの開発が快適になります。
