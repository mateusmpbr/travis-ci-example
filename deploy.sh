#!/bin/bash
set -e # Termina o script com um código diferente de 0 se algo falhar

# Roda o script de build da nossa aplicação
yarn build

# PR's (Pull Requests) e commits de branches diferentes da master não devem fazem o deploy (6 linhas a seguir)
SOURCE_BRANCH="master"

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deployment."
    exit 0
fi

# Entra na pasta de build do projeto e inicia um novo repositório git
cd build
git init

# Dentro desse repositório, nós pretendemos ser um novo usuário
git config user.name "Travis CI"
git config user.email "mateusmartinspereira@gmail.com"

# O primeiro e único commit do repositório terá todos os arquivos presentes e a mensagem do commit será "Deploy to GitHub Pages"
git add .
git commit -m "Deploy to GitHub Pages"

# Força o push da branch de origem master para a branch de destino gh-pages.
# Redireciona qualquer saída para /dev/null para ocultar quaisquer dados de credenciais que possam ser expostos.
# Suprime a saída de qualquer erro (2>&1)
# Tokens GH_TOKEN e GH_REF serão fornecidos como variáveis de ambiente do Travis CI

git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1