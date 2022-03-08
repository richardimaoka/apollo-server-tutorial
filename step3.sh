#!/bin/sh

# ## Apollo Server でいくつかの型を利用してみる

# 再掲ですが、ここまでの手順に沿っていれば、以下の2つのターミナルを立ち上げているはずです。

# - ターミナル1: `npm run start`を走らせ続けている状態
# - ターミナル2: 入力待ちの状態

# :large_orange_diamond: Action: ターミナル2で、以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
cp answers/index3.ts index.ts
# ```

# :white_check_mark: Result: いくつかの型が追加されました。

# ```diff:index.ts
# const typeDefs = gql`
#   type Query {
#     hello: String
# >   booleanValue: Boolean
# >   intValue: Int
# >   floatValue: Float
#   }
#  `;
# ```

# :large_orange_diamond: Action: ブラウザで http://localhost:4000/ を開いてください

# ![2022-01-26_23h46_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/98d0e41c-2d7b-ec1e-39c5-f523151092ef.png)

# :white_check_mark: Result: 先ほどと同じ手順で、今度は`hello`以外に、`booleanValue`, `floatValue`, `intValue`という新たな候補が現れているはずです。

# :large_orange_diamond: Action: 以下のクエリを"Operation"の部分に入力して、"Run"ボタンを押してください。

# ```graphql
# {
#   hello
#   booleanValue
#   floatValue
#   intValue
# }
# ```

# :white_check_mark: Result: このような結果が返されます。

# ![2022-01-26_23h49_43.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/6ffedafe-4396-4698-c63f-b6d0db352697.png)

# :large_orange_diamond: Action: ターミナル2で、以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
cp answers/index4.ts index.ts
# ```

# :large_orange_diamond: Action: クエリに`arrayOfInts`を追加してください。

# ![2022-01-26_23h50_50.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/70250d4c-eaaf-d746-6cf7-2d74f11e99e3.png)

# :white_check_mark: Result: このような結果が返されます。

# ![2022-01-26_23h51_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a781fcde-5c6e-60ad-9ad7-7c314299ce61.png)

# ApolloServerのmockは、Array型に対して要素数2のArrayを自動生成してくれます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```terminal: メイン (ターミナル)
cp answers/index5.ts index.ts
# ```

# :large_orange_diamond: Action: クエリに`arrayOfObjs`を入力してください。

# ![2022-01-26_23h54_59.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d6f9c4b7-99c3-3e7b-bc6a-4a2ab0aebb01.png)

# :white_check_mark: Result: このようなエラーが返されます。

# ![2022-01-26_23h59_09.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d6b92c0e-b1b7-cb35-2f9c-7dc8aca546c9.png)

# このエラーがなぜ起こるかというと、GraphQLのクエリ文法ではオブジェクト型のフィールドに対して、以下のような入れ子型のクエリを書かなくてはならないからです。

# :large_orange_diamond: Action: 以下のようにクエリを書き換えてください。


# ```graphql
# {
#   arrayOfObjs {
#     id
#     intValue
#     floatValue
#   }
# }
# ```

# :large_orange_diamond: Action: "Run"ボタンを押してください

# ![2022-01-26_23h51_24.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/a781fcde-5c6e-60ad-9ad7-7c314299ce61.png)

# :white_check_mark: Result: このような結果が返されます。

# ![2022-01-27_00h02_08.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/812a97ac-95f5-6ef0-0af0-fd874d8bb803.png)
