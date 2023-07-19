# 2.項目定義

1. 右表を参考に項目定義書を作成します。
2. 作成された項目定義をもとに以下のコンポーネントを作成します。

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
