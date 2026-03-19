#!/bin/bash
# torus-pptx plugin setup script
# SessionStart hook で呼ばれ、依存関係をインストールする
# 初回のみ実行し、2回目以降はスキップ

set -e

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT}"
DATA_DIR="${CLAUDE_PLUGIN_DATA}"

# データディレクトリがなければ作成
mkdir -p "${DATA_DIR}"

# --- Node.js (pptxgenjs) ---
if [ -f "${PLUGIN_ROOT}/package.json" ]; then
  if ! diff -q "${PLUGIN_ROOT}/package.json" "${DATA_DIR}/package.json" >/dev/null 2>&1; then
    echo "Installing Node.js dependencies..." >&2
    cp "${PLUGIN_ROOT}/package.json" "${DATA_DIR}/"
    cp "${PLUGIN_ROOT}/package-lock.json" "${DATA_DIR}/" 2>/dev/null || true
    (cd "${DATA_DIR}" && npm install --silent) >&2
  fi
fi

# --- Python (markitdown) ---
if [ -f "${PLUGIN_ROOT}/pyproject.toml" ]; then
  if ! diff -q "${PLUGIN_ROOT}/pyproject.toml" "${DATA_DIR}/pyproject.toml" >/dev/null 2>&1; then
    if command -v uv >/dev/null 2>&1; then
      echo "Installing Python dependencies..." >&2
      cp "${PLUGIN_ROOT}/pyproject.toml" "${DATA_DIR}/"
      cp "${PLUGIN_ROOT}/uv.lock" "${DATA_DIR}/" 2>/dev/null || true
      (cd "${DATA_DIR}" && uv sync --quiet) >&2
    else
      echo "Warning: uv not found, skipping Python dependencies. Content QA will be unavailable." >&2
    fi
  fi
fi

exit 0
