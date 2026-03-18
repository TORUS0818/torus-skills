# 調査の際に気をつけること
- 公式ドキュメントをもとに回答すること

# パッケージ管理
- Python: `uv` を使用すること（pip は使わない）
- Node.js: ローカルの `node_modules/` を使用（`npm install` で依存解決）
- セットアップ: `uv sync && npm install`