# 3.画面HTML作成

右の画面を基本的な画面構造＝ベースとなるHTMLとします。すなわち当画面はモバイルを意識した縦長の画面になっており、明細の一覧を下段に出力し、前段は下段の明細データを使用しメッセージ性を強調したグラフになります。このHTMLをChat-GPTにベースHTMLとして与え、これに改修を加えるのがシンプルかつ効率の良い画面開発だと考えます。ただし、チームでは別のフレームワークでの画面開発を検討しているのでこれは2023/7時点のソリューションと考えてください。

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
