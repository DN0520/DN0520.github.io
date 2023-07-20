# MuleSoftアプリ開発手順全容

MuleSoftを使用したアプリケーション開発の手順を一覧したものです。  
なお、下記はAnypoint platform上にFlowDesignerがないことを前提に作成しています。![MuleSoftアプリ開発手順](https://github.com/DN0520/DEC-Mule/blob/master/Desktop/A.MuleSoft/devgideMD/design1.jpg)

1. 仕様定義
2. 項目定義
3. 画面HTMLフォームの作成
4. DB環境の構築
5. PlatForm上でRAML作成
6. Studio取り込み・Config等概要設定
7. パブリッシュ
8. Platform上でProxy,SLAなどの設定
9. Studioで詳細設定・ARC使用・デバッガーテスト
10. デプロイ
11. 総合テスト
12. 本番移行

開発を実施する前に下記のプロダクトを準備しておく必要があります。

- AnyPointPlatform
- AnyPointStudio
- ChatGPT(V4がのぞましいが、V3.5でも対応可能)

下記トレーニング受講の前提として上記のプロダクトを導入します。  
[https://training.mulesoft.com/course/development-fundamentals-mule4-japanese](https://training.mulesoft.com/course/development-fundamentals-mule4-japanese)

# 1.仕様定義・システムデザイン

1. DX後の新しい業務フローやデータフローを用意します。
2. 業務フロー、データフローからアプリの基本的な流れを把握してMuleSoftのイベントプロセッサごとの機能を組合わせて下図のようなフローを作成してください。  
   ※右図は基本的なMuleアプリのオンラインおよびバッチプロセスの基本構造になっています。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design2.jpg)
3. ここでAPIのエンドポイントや各コンポーネントのネーミングを確定させてください。
4. 上図は個々のAPIのデザイン図になるが、下図ではMuleSoftのAPI-LED POLICYにあわせた3層構造を明らかにします。
5. この図をもとにRAMLを作成するので必要項目はここで押さえます。

#### Muleアプリケーション開発リファレンス

[参照リンク](https://docs.mulesoft.com/jp/mule-runtime/4.4/mule-app-dev)

# 2.項目定義

1. 下表を参考に項目定義書を作成します。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design3.jpg)
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

# 3.画面HTML作成

下の画面を基本的な画面構造と定義し、ベースとなるHTMLを共有します。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design4.jpg)

当画面はモバイルを意識した縦長の画面になっており、明細の一覧を下段に出力し、前段は下段の明細データを使用しメッセージ性を強調したグラフになります。このHTMLをChat-GPTにベースHTMLとして与え、これ改修を加えるのがシンプルかつ効率の良い画面開発だと考えます。ただし、チームでは別のフレームワークでの画面開発を検討しているのでこれは2023/7時点のソリューションと考えてください。

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
  <style>
    .container {
      display: flex;
      justify-content: space-between;
    }

    .text {
      width: 45%;
      padding: 20px;
      border: 2px solid black;
    }

    .img-container {
      width: 45%;
      padding: 20px;
      position: relative;
    }

    #myimage {
      border: 2px solid black;
    }

    .expand-text {
      position: relative;
      display: block;
      text-align: right;
      background: white;
      padding: 2px 5px;
      margin-bottom: 10px;
    }

    .button-group {
      text-align: center;
    }

    button {
      margin: 10px;
    }

    .active {
      background: lightgray;
    }
  </style>
</head>
<body>
  <div class="button-group">
    <button onclick="changeContent(1)">手順全容</button>
    <button onclick="changeContent(2)">仕様定義</button>
    <button onclick="changeContent(3)">項目定義</button>
    <button onclick="changeContent(4)">画面作成</button>
    <button onclick="changeContent(5)">RAML作成</button>
    <button onclick="changeContent(6)">DB構築</button>
    <button onclick="changeContent(7)">テスト</button>
    <button onclick="changeContent(8)">デプロイ</button>
  </div>
  <div class="container">
    <div class="text" id="mytext">
      <!-- The text will be inserted here by JavaScript -->
    </div>
    <div class="img-container">
      <img id="myimage" src="design1.jpg" width="600" height="400" onclick="openInNewWindow(this.src);">
    </div>
    <span class="expand-text">＊クリックしたら拡大します</span>
  </div>

  <script>
    // Fetch the text from a Markdown file and convert to HTML
    function loadContent(pageNumber) {
      fetch('req' + pageNumber + '.md')
        .then(response => response.text())
        .then(data => {
          document.getElementById('mytext').innerHTML = marked.parse(data);
          document.getElementById('myimage').src = "design" + pageNumber + ".jpg";
        });
    }

    // load initial content
    loadContent(1);

    // Function to open image in new window with specific size
    function openInNewWindow(src) {
      var width = window.innerWidth * 0.65; // 65% of window width
      var height = window.innerHeight; // full window height
      var left = window.innerWidth * 0.35; // set left position to 35% of window width
      window.open(src, '_blank', 'width=' + width + ',height=' + height + ',left=' + left);
    }

    // Function to change the content
    function changeContent(pageNumber) {
      loadContent(pageNumber);
      Array.from(document.getElementsByTagName('button')).forEach((button, index) => {
        if (index === pageNumber - 1) {
          button.classList.add('active');
        } else {
          button.classList.remove('active');
        }
      });
    }
  </script>
</body>
</html>
```

---

# 4.DBの構築

1. **MySQLのインストール**: 下記のサイトよりMySQLをインストールします。
   [https://dev.mysql.com/doc/refman/8.0/ja/windows-installation.html](https://dev.mysql.com/doc/refman/8.0/ja/windows-installation.html)

2. **MySQL ShellとWorkbenchの準備**: MySQL ShellとWorkbenchを準備し、Workbenchで以下の手順を実施します。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design5.jpg)

3. **データベースとテーブルの作成**:
   
   1. **データベースの作成**:
      
      ```sql
      CREATE DATABASE mydatabase;
      ```
      
      このコマンドは新しいデータベース`mydatabase`を作成します。
   
   2. **テーブルの作成**:
      
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
      
      まず`USE mydatabase;`で作成したデータベースを選択し、その後で`CREATE TABLE`文を使用して`employees`という名前のテーブルを作成しています。
      
      # 5.RAML作成

MuleSoftのAnypoint PlatformのDesign CenterではAPIの設計とモデリングを簡単に行うことができます。

1. **Anypoint Platformにログイン**: MuleSoftのAnypoint Platformにログインします。まだアカウントを作成していない場合は、新規に作成します。

2. **Design Centerを開く**: ナビゲーションメニューからDesign Centerを選択します。

3. **新しいAPI仕様を作成**: "Create new"をクリックし、ドロップダウンリストから"API specification"を選択します。

4. **API仕様名を入力**: API仕様の名前を入力し、言語として"RAML"を選択します。バージョンはデフォルトの"1.0"を使用できます。

5. **APIデザインの作成**: この時点で、RAML APIデザイナーが開きます。ここでAPIの構造、リソース、メソッド、レスポンスなどを定義します。また、データ型やトレイトなどの再利用可能な要素も定義できます。
   
   - **リソースの追加**: 左側のリソースタブからリソースを追加します。URLの一部として表現され、ネストも可能です。
   
   - **メソッドの追加**: 各リソースに対して可能な操作を追加します。例えばGET, POST, PUT, DELETEなどのHTTPメソッドを追加します。
   
   - **レスポンスの定義**: 追加したメソッドに対して期待するレスポンスを定義します。これにはステータスコードとレスポンスボディが含まれます。
   
   - **データ型の定義**: APIで使用されるデータ型を定義します。これらはリクエストボディやレスポンスボディに使用されます。項目定義で作成したExampleを流用します。

6. **APIのテスト**: 右側の"Mocking service"タブを使用して、APIのテストを行います。これはAPIが期待通りに動作しているかを確認するのに役立ちます。

7. **APIの公開**: APIが完全に設計され、テストが成功したら、APIを公開します。"Publish"ボタンをクリックするとAPI PortalにAPIが公開されます。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design6.jpg)

---

# APIプロキシ作成、セキュリティ設定、SLA適用

---

**APIをAnypoint Exchangeに公開する**

1. Anypoint Platformにログインします。
2. 左側のナビゲーションメニューから`Design Center`を選択します。
3. `Create new API specification`をクリックし、新しいAPIを設計します。APIの詳細（名前、バージョンなど）を設定し、`Create Specification`をクリックします。
4. API DesignerでAPIを設計します。APIの設計が完了したら、右上の`Publish`をクリックします。
5. `Publish to Exchange`を選択し、APIをAnypoint Exchangeに公開します。

**APIプロキシの作成とセキュリティ設定**

1. Anypoint Platformのホーム画面に戻り、`API Manager`を選択します。
2. `Manage API from Exchange`をクリックします。
3. 公開したAPIを選択し、`Manage API`をクリックします。
4. `API proxy`設定画面で、必要な情報（Implementation URIなど）を入力し、`Save`をクリックします。
5. セキュリティ設定を行いたい場合は、`Policies`セクションを選択し、`Apply New Policy`をクリックします。必要なポリシーを選択し、ポリシー設定を行い、`Apply`をクリックします。

**SLAの適用**

1. `Policies`セクションに戻り、`SLA-Based policies`カテゴリーを開きます。
2. `Apply New Policy`をクリックし、SLAポリシーを選択します。
3. SLAポリシーの詳細を設定し、`Apply`をクリックします。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design7.jpg)

---



# Anypoint Studioは、APIの開発とテストを行うための統合開発環境（IDE）であり、以下のような設定が可能です：

**1. エンドポイントの設定:**

Anypoint Studioでは、作成したAPIのエンドポイントの設定を行うことが可能です。これにはHTTP Listenerの設定（ポート、ホスト、パスなど）が含まれます。

**2. データ変換とマッピング:**

DataWeaveというデータ変換言語を利用して、異なるデータフォーマット間での変換とマッピングを行うことができます。

**3. ロジックとフローの構築:**

MuleSoftのFlowとSubflowを使用して、APIのビジネスロジックと処理のフローを設定することができます。

**4. エラーハンドリング:**

異なる種類のエラーに対して適切に応答するエラーハンドリングの設定を行うことができます。

**5. ポリシーとセキュリティ設定:**

Anypoint Studioでは、MuleSoftのAPI Managerを通じてAPIにセキュリティポリシーを適用することができます。

**6. テストケースの作成:**

MUnitと呼ばれる単体テストフレームワークを利用して、APIのテストケースを作成することが可能です。

**7. デバッグ:**

Anypoint Studioのデバッガを使用して、APIの問題を特定し、修正することができます。

これらは一部の主な設定で、その他にも多くの高度な設定やカスタマイズが可能です。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design8.jpg)

---

# デプロイ

Anypoint Studioから直接CloudHubにデプロイするためには、次のステップを行います：

1. Anypoint Studioのメニューバーから、`File > Export` を選択します。
2. `Anypoint Studio Project to Mule Deployable Archive (includes Studio metadata)` を選択し、`Next`をクリックします。
3. エクスポートするプロジェクトと出力ファイルの場所を選択し、`Finish`をクリックします。
4. これにより、アプリケーションの.jarファイルが作成されます。

次に、Anypoint PlatformのWebインターフェースを使用してCloudHubにデプロイします：

5. Anypoint Platformにログインします。ナビゲーションメニューからRuntime Managerを選択し、Applicationsタブに移動します。
6. `Deploy application`ボタンをクリックします。
7. 必要な情報（アプリケーション名、デプロイメント先のリージョン、ランタイムバージョンなど）を入力し、先ほどエクスポートした.jarファイルをアップロードします。
8. 最後に`Deploy Application`ボタンをクリックしてデプロイを完了します。

この操作が成功すると、CloudHub上にAPIがデプロイされ、インターネット経由でアクセスできるようになります。CloudHubでデプロイしたアプリケーションは、`{your-application-name}.cloudhub.io`というURLでアクセスできます。そのため、HTMLファイルのAPIエンドポイントURLをこの新しいURLに更新する必要があります。![Any description here](C:\Users\li3930\Desktop\A.MuleSoft\devgideMD\design9.jpg)

