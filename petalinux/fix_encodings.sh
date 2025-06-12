#!/bin/bash

# Skrypt do konwersji wszystkich plików do UTF-8 i czyszczenia duplikatów

# Usuniecie potencjalnych duplikatów plików
find project-spec/meta-user/recipes-core/images -name "petalinux-image-minimal.bbappend.*" -delete
find project-spec/meta-user/recipes-core/images -name "image-nfs.inc.*" -delete

# Konwersja plików do UTF-8
find . -type f -name "*.inc" -o -name "*.bbappend" -o -name "*.conf" | while read file; do
    # Sprawdz czy plik jest tekstowy
    if file "$file" | grep -q text; then
        echo "Konwersja $file do UTF-8"
        # Utworz tymczasowy plik z poprawnym kodowaniem
        iconv -f ISO-8859-2 -t UTF-8 "$file" > "${file}.utf8" 2>/dev/null || iconv -f ISO-8859-1 -t UTF-8 "$file" > "${file}.utf8" 2>/dev/null || cp "$file" "${file}.utf8"
        mv "${file}.utf8" "$file"
    fi
done

echo "Konwersja zakonczona!"
