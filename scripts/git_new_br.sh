#!/bin/bash
set -e

cd "$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Hata: Bu dizin bir Git deposu değil."
    exit 1
}

BRANCH="$1"
if [ -z "$BRANCH" ]; then
    echo "Kullanım: $0 <yeni-dal-adı>"
    exit 1
fi

echo "--- Yeni dal oluşturuluyor: $BRANCH ---"
git checkout -b "$BRANCH"
echo "--- Şu an dal: $(git branch --show-current) ---"
