FROM docker/sandbox-templates:claude-code

USER root

# 基本ツール追加
RUN apt-get update && apt-get install -y --no-install-recommends \
    zsh \
    fzf \
    ripgrep \
    fd-find \
    bat \
    delta \
    tmux \
    curl \
    jq \
    make \
    vim \
    && rm -rf /var/lib/apt/lists/*

# fd-find, bat は Debian系で別名なのでシンボリックリンク作成
RUN ln -sf /usr/bin/fdfind /usr/local/bin/fd && \
    ln -sf /usr/bin/batcat /usr/local/bin/bat

# starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# mise
RUN curl https://mise.run | MISE_INSTALL_PATH=/usr/local/bin/mise sh

# direnv
RUN curl -sfL https://direnv.net/install.sh | bash

# ghq
RUN GHQ_VERSION=$(curl -s https://api.github.com/repos/x-motemen/ghq/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/^v//') && \
    ARCH=$(uname -m | sed 's/aarch64/arm64/' | sed 's/x86_64/amd64/') && \
    curl -sL "https://github.com/x-motemen/ghq/releases/download/v${GHQ_VERSION}/ghq_linux_${ARCH}.zip" -o /tmp/ghq.zip && \
    unzip -o /tmp/ghq.zip -d /tmp/ghq && \
    mv /tmp/ghq/ghq_linux_${ARCH}/ghq /usr/local/bin/ghq && \
    chmod +x /usr/local/bin/ghq && \
    rm -rf /tmp/ghq /tmp/ghq.zip

# Homebrew は sandbox では不要 — /opt/homebrew/bin/brew をスキップ用ダミー作成
RUN mkdir -p /opt/homebrew/bin && \
    printf '#!/bin/sh\n' > /opt/homebrew/bin/brew && \
    chmod +x /opt/homebrew/bin/brew

# 1password CLI のソース先を空ファイルで用意（エラー回避）
RUN mkdir -p /Users/shshimamo/.config/op && \
    touch /Users/shshimamo/.config/op/plugins.sh

# dotfiles リンク用スクリプト
COPY setup-dotfiles.sh /usr/local/bin/setup-dotfiles
RUN chmod +x /usr/local/bin/setup-dotfiles

# zsh をデフォルトシェルに
RUN chsh -s /usr/bin/zsh agent

# sandbox 内であることを示す環境変数
ENV SBX=1
ENV GHQ_ROOT=/Users/shshimamo/devel/src

USER agent
