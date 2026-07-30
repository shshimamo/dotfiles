#!/bin/bash
MSG="${1:-入力待ち}"
CWD=$(cat | jq -r '.cwd // empty' 2>/dev/null)
DIR=$(basename "$CWD")
osascript -e "display notification \"${MSG}\" with title \"Claude Code - ${DIR}\" sound name \"Glass\""
