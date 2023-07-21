MULEアプリ・ネーミングルール

| コンポーネント       | 説明                                      | 例                                          |
| ------------------- | --------------------------------------- | ------------------------------------------ |
| プロジェクト名      | プロジェクトの目的や目標を表現　　        | `PersonalBudjetManagement`                      |
| API名       　　　　| xxxxx-xxxxx--api 全小文字  APIの機能を表現したもの　　　　　         | `personal-budget-api`                      |
| 変数名          | 変数が何を保持するのかを明示。小文字で始まる                 | `orderDate`                                |
| 定数名          | 定数が何を表すのかを明示。全て大文字で、単語間にアンダースコアを使用     | `MAX_ORDER_QUANTITY`                       |
| エンドポイント名   | HTTP, JMS, FTPなどのエンドポイントの名前も考慮         | `/personalBudget:`                   |
| FlowとSubflow | それぞれのFlowとSubflowの役割を明確にする名前が必要        | `processOrderFlow`, `validateOrderSubflow` |
| エラーハンドラー名         | デフォルト以外の例外戦略を作成する場合、それらを識別する名前が必要      | `customErrorHandler`                       |
| データWeave変換   | 入力と出力の形式に基づいて変換の名前を設定                  | `xmlToJsonTransform`                       |
