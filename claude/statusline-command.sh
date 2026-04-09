#!/bin/sh
input=$(cat)

# Directory
dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
# Shorten home directory to ~
home="$HOME"
dir="${dir/#$home/\~}"

# Git branch
branch=$(git -C "$(echo "$input" | jq -r '.workspace.current_dir // .cwd')" symbolic-ref --short HEAD 2>/dev/null)

# Model
model=$(echo "$input" | jq -r '.model.display_name // ""')

# Context remaining
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Cost
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')

# Build status line
line="$dir"
[ -n "$branch" ] && line="$line (* $branch)"
[ -n "$model" ] && line="$line | $model"
[ -n "$remaining" ] && line="$line | Ctx: ${remaining}%"
[ -n "$cost" ] && line=$(printf '%s | $%.2f' "$line" "$cost")

printf '%s' "$line"
