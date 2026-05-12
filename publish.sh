#!/bin/bash
# Publica el BLUEPRINT-BOT.html a GitHub Pages.
# URL pública: https://andreslinares-tech.github.io/tuplansalud-blueprint/
#
# Uso:
#   ./publish.sh "mensaje commit opcional"

set -e

cd "$(dirname "$0")"

# 1. Copiar el último BLUEPRINT-BOT.html como index.html
cp ../_diagramas/BLUEPRINT-BOT.html index.html

# 2. Detectar si hay cambios
if git diff --quiet index.html; then
  echo "Sin cambios en el blueprint. Nada que publicar."
  exit 0
fi

# 3. Commit + push
MSG="${1:-Update blueprint $(date +%Y-%m-%d)}"
git add index.html
git -c commit.gpgsign=false commit -m "$MSG"
git push origin main

echo ""
echo "✅ Publicado. URL pública:"
echo "   https://andreslinares-tech.github.io/tuplansalud-blueprint/"
echo ""
echo "ℹ️  GitHub Pages puede tardar 1-2 minutos en reflejar el cambio."
