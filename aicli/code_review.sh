#!/bin/bash
echo "Running AI Code Review..."

DIFF=$(git diff origin/main...HEAD)

if [ -z "$DIFF" ]; then
  echo "No changes detected."
  exit 0
fi

RESPONSE=$(openai chat completions create -m gpt-4o-mini -p "Você é um revisor de código especializado em Angular. Analise as seguintes alterações de código e sugira melhorias, potenciais bugs ou pontos de atenção:\n\n$DIFF" --max-tokens 500 --temperature 0.3)

echo "AI Code Review Result:"
echo "$RESPONSE"