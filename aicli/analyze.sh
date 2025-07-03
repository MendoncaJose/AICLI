#!/bin/bash
echo "Running AI Static Code Analysis..."

# Pega arquivos .ts e .html modificados no PR contra main
FILES=$(git diff --name-only origin/main...HEAD | grep -E '\.ts$|\.html$')

if [ -z "$FILES" ]; then
  echo "No Angular files changed."
  exit 0
fi

for file in $FILES; do
  echo "Analyzing $file ..."
  CONTENT=$(cat "$file")
  RESPONSE=$(openai chat completions create -m gpt-4o-mini -p "Você é um analista de código Angular. Analise o seguinte arquivo para possíveis problemas, bugs ou melhorias:\n\n$CONTENT" --max-tokens 300 --temperature 0.2)
  echo "Analysis for $file:"
  echo "$RESPONSE"
  echo "----------------------------------------"
done
