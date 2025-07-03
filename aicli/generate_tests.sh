#!/bin/bash
echo "Generating or updating Angular tests..."

DIFF=$(git diff origin/main...HEAD)

if [ -z "$DIFF" ]; then
  echo "No changes detected."
  exit 0
fi

RESPONSE=$(openai chat completions create -m gpt-4o-mini -p "Você é um especialista em Angular e Jasmine/Karma. Baseando-se nas seguintes alterações de código, gere ou atualize os testes unitários apropriados:\n\n$DIFF" --max-tokens 700 --temperature 0.3)

echo "Generated/Updated Tests Suggestions:"
echo "$RESPONSE"
