# torus-skills

Claude Code 用のカスタムスキルコレクション。

## torus-pptx

コンサルティングファーム風の高品質な PowerPoint プレゼンテーションを自動作成するスキル。

### 特徴

- **デザインシステム**: 白背景 + Deep Royal Blue (`002B5C`) + グレー階調。セリフ見出し (Georgia) + サンセリフ本文 (Arial)
- **構造化されたスライド**: 7要素構成（タイトル、メッセージライン、サブメッセージ、ボディ、注釈、出所、ページ番号）
- **4メッセージフレームワーク**: 現状認識 → 問題提起 → 解決策 → 期待効果
- **新規作成 + 既存編集**: PptxGenJS (JavaScript) でゼロから作成、Python スクリプトで既存 pptx を編集

### インストール

```bash
# マーケットプレイスを追加
/plugin marketplace add TORUS0818/torus-skills

# プラグインをインストール
/plugin install torus-pptx@torus-skills
```

### 依存関係のセットアップ

セッション開始時に hook が自動実行され、依存関係がインストールされます（初回のみ）。

- **Node.js** (pptxgenjs) — 自動インストール
- **Python** (markitdown) — `uv` がインストール済みであれば自動インストール

手動でセットアップする場合：

```bash
npm install pptxgenjs        # 新規作成用
uv add "markitdown[pptx]"    # Content QA用（任意）
```

### 使い方

```
/torus-pptx:pptx
```

または、「スライド」「プレゼン」「pptx」等のキーワードで自動トリガーされます。

### デザインシステムの構成ソース

| ソース | 取り入れた要素 |
|--------|-------------|
| [アクセンチュア スライド作成の秘訣](https://www.accenture.com/jp-ja/blogs/japan-careers-blog/powerpoint) | 7要素構成、メッセージライン、4メッセージフレームワーク、着手前プロセス |
| McKinsey風プロンプトパターン | 白背景、Deep Royal Blue、セリフ見出し、fine hairline borders、高情報密度 |
| Anthropic公式 pptx スキル | レイアウトパターン、カードスタイル、QAワークフロー、PptxGenJS/編集スクリプト |

## ライセンス

MIT
