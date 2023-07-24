MULEアプリ・ネーミングルール
| コンポーネント                | 説明 | ケース | 例 |
| --- | --- | --- | --- |
| プロジェクト名                | プロジェクトの目的や目標を表現 | アッパーキャメルケース | `PersonalBudjetManagement` |
| API名                         | 全て小文字、ハイフンで連結。 APIの機能を表現したものにする | ケバブケース | `personal-budget-api` |
| 項目名・変数名・クエリパラメータ | 項目および変数が何を保持するのかを明示。計算時-（マイナス)と混乱しないためにはスネークケースが妥当 | スネークケース | `order_date`, `trx_date` |
| エンドポイント名              | 小文字の名詞を使用する。2名詞合わせる場合はハイフンで連結 | ケバブケース | `/users`, `/account`, `/personal-budget` |
| FlowとSubflow                | それぞれのFlowとSubflowの役割を明確にする名前が必要 | ローワーキャメルケース | `processOrderFlow`, `validateOrderSubflow` |
| エラーハンドラー名            | デフォルト以外の例外戦略を作成する場合、それらを識別する名前が必要 | ローワーキャメルケース | `customErrorHandler` |
| データWeave変換              | 入力と出力の形式に基づいて変換の名前を設定 | ローワーキャメルケース | `xmlToJsonTransform` |
