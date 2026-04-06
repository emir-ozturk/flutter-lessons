#!/bin/bash

# Parametre Kontrolü
COMMIT_MESAJI=$1
REPO_URL=$2

if [ -z "$COMMIT_MESAJI" ] || [ -z "$REPO_URL" ]; then
    echo "Hata: Eksik bilgi girdiniz."
    echo "Kullanım: ./git-baslat.sh 'İlk commit mesajım' 'https://github.com/kullanici/repo.git'"
    exit 1
fi

# Git Başlatma (Eğer hali hazırda yoksa)
if [ ! -d ".git" ]; then
    echo "--- Git başlatılıyor... ---"
    git init
else
    echo "--- Git zaten mevcut, devam ediliyor... ---"
fi

# İşlemler
git add .
git commit -m "$COMMIT_MESAJI"
git branch -M main

# Uzak Depo Ayarı
# Eğer 'origin' zaten tanımlıysa güncelle, değilse ekle
if git remote | grep -q 'origin'; then
    git remote set-url origin "$REPO_URL"
else
    git remote add origin "$REPO_URL"
fi

# GitHub'a Gönder
echo "--- Kodlar GitHub'a gönderiliyor... ---"
git push -u origin main

echo "--- İşlem başarıyla tamamlandı! ---"