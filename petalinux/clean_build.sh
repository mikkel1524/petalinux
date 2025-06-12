#!/bin/bash

# Skrypt do wyczyszczenia kompilacji i duplikatów

echo "Czyszczenie katalogu build..."
petalinux-build -x mrproper

echo "Usuwanie potencjalnych duplikatów..."
find project-spec/meta-user/recipes-core/images -name "*.bbappend.*" -delete
find project-spec/meta-user/recipes-core/images -name "*.inc.*" -delete

echo "Czyszczenie zakonczone. Mozesz teraz uruchomic build_nfs.sh"
