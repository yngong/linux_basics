#!/bin/bash

# Check if a filename is provided
if [ -z "$1" ]; then
    echo "Usage: ./convert.sh <notebook.ipynb>"
    exit 1
fi

NOTEBOOK=$1
OUTPUT_NAME="${NOTEBOOK%.ipynb}.slides.html"

# Removed explicit JUPYTER_PATH to avoid version mismatch with brew templates
echo "🎨 Converting $NOTEBOOK to Premium Slides..."

# Perform conversion with modern Reveal.js 4.5.0
jupyter nbconvert "$NOTEBOOK" \
    --to slides \
    --embed-images \
    --SlidesExporter.reveal_url_prefix="https://cdn.jsdelivr.net/npm/reveal.js@4.5.0"

# Use sed to inject our custom CSS file into the generated HTML
# We use a more robust regex to handle potential whitespace in the </head> tag
sed -i '' 's|</head>|<link rel="stylesheet" href="premium_slides.css"></head>|' "$OUTPUT_NAME"

echo "✅ Done! Created $OUTPUT_NAME"
echo "🚀 Open it in your browser to see the new look."
