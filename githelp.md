# Atualizar sua branch de acordo com o repositorio atual

## Usando esse repositório

1. Usando merge (mais simples e seguro)

Você mantém o histórico inteiro, com um commit de merge no final:

```git
git checkout minha-feature
git fetch origin
git merge origin/main
```

## No Fork (Seu reposítorio do seu perfil)

No **fork** é a mesma coisa — a diferença é só de **onde vêm as mudanças**:

* `origin` → é o seu fork no GitHub.
* `upstream` → normalmente você configura para apontar para o **repositório original**.

Ou seja:

Se você quer atualizar sua branch (`minha-feature`) com as mudanças que aconteceram na **principal do seu fork**:

```bash
git checkout minha-feature
git fetch origin
git merge origin/main
```

Se você quer atualizar sua branch com as mudanças da **principal do repositório original** (não só do fork), primeiro precisa ter o `upstream` configurado:

```bash
git remote add upstream https://github.com/ORIGINAL_USER/ORIGINAL_REPO.git
```

Aí o comando seria:

```bash
git checkout minha-feature
git fetch upstream
git merge upstream/main
```
