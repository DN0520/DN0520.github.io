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
3. SLAポリシーの詳細を設定し、`Apply`をクリックします。

---

以上が一般的な手順ですが、具体的な設定や選択肢はAPIの要件やMuleSoftのバージョンによります。また、特定のセキュリティ設定やSLAの適用には事前にMuleSoftでの設定が必要な場合があります。詳細な設定は公式のドキュメンテーションをご覧ください。
