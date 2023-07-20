ネーミングルール

| コンポーネント      | 説明                                      | 例                                          |
| ------------ | --------------------------------------- | ------------------------------------------ |
| プロジェクト名      | プロジェクト全体を識別する名前。プロジェクトの目的や目標を表す。        | `PersonalBudjetManagement`                      |
| API名       　　　　| xxxxx-xxxxx--api 小文字  APIの機能を表したもの　　　　　         | `personal-budget-api`                      |
| 変数名          | 変数が何を保持するのかを明示。小文字で始まる。                 | `orderDate`                                |
| 定数名          | 定数が何を表すのかを明示。全て大文字で、単語間にアンダースコアを使用。     | `MAX_ORDER_QUANTITY`                       |
| エンドポイントの名前   | HTTP, JMS, FTPなどのエンドポイントの名前も考慮。         | `paymentGatewayEndpoint`                   |
| FlowとSubflow | それぞれのFlowとSubflowの役割を明確にする名前が必要。        | `processOrderFlow`, `validateOrderSubflow` |
| 例外戦略         | デフォルト以外の例外戦略を作成する場合、それらを識別する名前が必要。      | `customErrorHandler`                       |
| データWeave変換   | 入力と出力の形式に基づいて変換の名前を設定。                  | `xmlToJsonTransform`                       |
