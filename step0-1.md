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
