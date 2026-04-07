#!/bin/bash
set -e

cd "$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Hata: Bu dizin bir Git deposu değil."
    exit 1
}

BRANCH="$1"
if [ -z "$BRANCH" ]; then
    echo "Kullanım: $0 <dal-adı> [-f] [-r]"
    echo "  -f  Zorla sil (git branch -D)"
    echo "  -r  Uzak depodan da sil (git push origin --delete)"
    exit 1
fi

shift
FORCE_FLAG=""
DELETE_REMOTE=""
for arg in "$@"; do
    case "$arg" in
        -f) FORCE_FLAG=1 ;;
        -r) DELETE_REMOTE=1 ;;
        *)
            echo "Bilinmeyen seçenek: $arg"
            exit 1
            ;;
    esac
done

CURRENT="$(git branch --show-current)"
if [ "$BRANCH" = "$CURRENT" ]; then
    echo "Hata: Şu an bu daldasınız. Silmeden önce başka bir dala geçin."
    exit 1
fi

if [ -n "$FORCE_FLAG" ]; then
    echo "--- Dal zorla siliniyor: $BRANCH ---"
    git branch -D "$BRANCH"
else
    echo "--- Dal siliniyor: $BRANCH ---"
    git branch -d "$BRANCH"
fi

if [ -n "$DELETE_REMOTE" ]; then
    echo "--- Uzak depo (origin) üzerinden siliniyor: $BRANCH ---"
    git push origin --delete "$BRANCH"
fi

echo "--- İşlem tamamlandı. ---"
