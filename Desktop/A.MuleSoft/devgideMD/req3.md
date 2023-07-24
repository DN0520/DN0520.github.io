# 2.項目定義

1. 右表を参考に項目定義書を作成します。
2. 項目定義をするにあたり、下表MULEアプリネーミングルールを参照します。
3. 作成された項目定義をもとに以下のアプリに必要となる各種コンポーネントを作成します。

####MULEアプリ・ネーミングルール
| コンポーネント                | 説明 | ケース | 例 |
| --- | --- | --- | --- |
| プロジェクト名                | プロジェクトの目的や目標を表現 | アッパーキャメルケース | `PersonalBudjetManagement` |
| API名                         | 全て小文字、ハイフンで連結。 APIの機能を表現したものにする | ケバブケース | `personal-budget-api` |
| 項目名・変数名・クエリパラメータ | 項目および変数が何を保持するのかを明示。計算時-（マイナス)と混乱しないためにはスネークケースが妥当 | スネークケース | `order_date`, `trx_date` |
| エンドポイント名              | 小文字の名詞を使用する。2名詞合わせる場合はハイフンで連結 | ケバブケース | `/users`, `/account`, `/personal-budget` |
| FlowとSubflow                | それぞれのFlowとSubflowの役割を明確にする名前が必要 | ローワーキャメルケース | `processOrderFlow`, `validateOrderSubflow` |
| エラーハンドラー名            | デフォルト以外の例外戦略を作成する場合、それらを識別する名前が必要 | ローワーキャメルケース | `customErrorHandler` |
| データWeave変換              | 入力と出力の形式に基づいて変換の名前を設定 | ローワーキャメルケース | `xmlToJsonTransform` |


#### RAML用example

```yaml
body: 
  application/json:
    example: |
      {
        “Account_Number”: “12345678901234”,
        “Account_Month”: “202306”,
        “TRX_Date”: “20230601”,
        “Category_Code”: “008”,
        “TRX_Category”: “rent house”,
        “TRX_TYPE”: “deposit”,
        “AMOUNT”: 200000
      }
```

#### DB Select結果(java)からjsonへのtransform 用dataweave

```dataweave
%dw 2.0 output application/json
  payload map ( payload01 , indexOfPayload01 ) -> {
    Account_Number: payload01.Account_Number as String default "",
    Account_Month: payload01.Account_Month as String default "",
    TRX_Date: payload01.TRX_Date as String default "",
    Category_Code: payload01.Category_Code as String default "",
    TRX_Category: payload01.TRX_Category as String default "",  
    TRX_TYPE: payload01.TRX_TYPE as String default "",
    AMOUNT: payload01.AMOUNT as Number default 0
  }
```

#### Create Table コマンド

```sql
USE mydatabase;

CREATE TABLE employees (
  id INT AUTO_INCREMENT,
  firstName VARCHAR(40),
  lastName VARCHAR(40),
  email VARCHAR(60),
  birthDate DATE,
  PRIMARY KEY (id)
);
```

---
