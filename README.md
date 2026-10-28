# FormStudio 第1版 v1.0.0

Cloudflare Workers + D1で動くフォーム作成・回答収集サービスです。

## 第1版の機能
- 管理者ログイン
- フォーム作成・編集・削除
- 下書き／受付中／受付終了
- 13種類の質問
- 公開回答URL
- 必須入力、受付期間、回答上限
- 回答一覧、個別削除、CSV出力
- スマートフォン・iPad対応
- CSV数式インジェクション対策
- 管理パスワードをSecretで保存

## 重要
`wrangler.jsonc`の`database_id`は、D1作成後に表示されるIDへ差し替えてください。管理パスワードとセッション署名鍵はGitHubへ書かず、Cloudflare Secretで設定します。
