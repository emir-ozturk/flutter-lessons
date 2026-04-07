#!/bin/bash
set -e

cd "$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Hata: Bu dizin bir Git deposu değil."
    exit 1
}

COMMIT_MSG="$1"
# İkinci argüman verilirse o dal, yoksa mevcut dal
BRANCH="${2:-$(git branch --show-current)}"

if [ -z "$COMMIT_MSG" ]; then
    echo "Kullanım: $0 'commit mesajı' [dal-adı]"
    exit 1
fi

if [ -z "$BRANCH" ]; then
    echo "Hata: Aktif dal yok ve dal adı verilmedi."
    exit 1
fi

echo "--- git add . ---"
git add .

if git diff --cached --quiet; then
    echo "--- Commit edilecek değişiklik yok (atlanıyor). ---"
else
    echo "--- git commit ---"
    git commit -m "$COMMIT_MSG"
fi

echo "--- git push origin $BRANCH ---"
git push -u origin "$BRANCH"
echo "--- İşlem tamamlandı. ---"
