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

この操作が成功すると、CloudHub上にAPIがデプロイされ、インターネット経由でアクセスできるようになります。CloudHubでデプロイしたアプリケーションは、`{your-application-name}.cloudhub.io`というURLでアクセスできます。そのため、HTMLファイルのAPIエンドポイントURLをこの新しいURLに更新する必要があります。
