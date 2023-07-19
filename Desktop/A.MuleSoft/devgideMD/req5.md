# 4.DBの構築

1. **MySQLのインストール**: 下記のサイトよりMySQLをインストールします。
   [https://dev.mysql.com/doc/refman/8.0/ja/windows-installation.html](https://dev.mysql.com/doc/refman/8.0/ja/windows-installation.html)

2. **MySQL ShellとWorkbenchの準備**: MySQL ShellとWorkbenchを準備し、Workbenchで以下の手順を実施します。

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
