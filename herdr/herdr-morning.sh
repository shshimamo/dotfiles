#!/usr/bin/env bash
set -euo pipefail

test "${HERDR_ENV:-}" = 1 || { echo "herdr の中で実行して" >&2; exit 1; }

open_tab() {  # label cwd command
  local pane
  pane=$(herdr tab create --workspace "$HERDR_WORKSPACE_ID" --label "$1" --cwd "$2" --no-focus \
    | jq -r .result.root_pane.pane_id)
  herdr pane run "$pane" "$3"
}

open_tab a ~ "echo a"
open_tab b ~ "echo b"
open_tab c ~ "echo c"
