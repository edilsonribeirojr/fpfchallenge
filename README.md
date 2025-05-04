# FPF Tech - Flutter Project

## Descrição

Este projeto é uma aplicação Flutter que foi desenvolvida como parte do "Desafio Técnico FPF Tech - Flutter". O projeto consiste em três partes principais, que abordam o gerenciamento de tarefas e a integração com uma API pública.

---

## Estrutura do Projeto

### Parte 1: Função para Análise de Lista

- Foi implementada uma função em Dart que recebe uma lista de números e retorna o menor número, o maior número e a soma dos números na lista.
- A função foi testada utilizando o framework de testes do Dart.
  
### Parte 2: Interface do Usuário (Flutter)

- Foi criada uma aplicação Flutter com duas telas principais:
  1. **Tela de Lista de Tarefas**: Mostra as tarefas em uma lista com a possibilidade de alternar o status da tarefa (Pendente/Concluída).
  2. **Tela de Adição de Tarefas**: Permite o usuário adicionar novas tarefas com nome e descrição.
- As tarefas são armazenadas localmente usando o pacote `shared_preferences`.

  - **Funcionalidade**: 
    - As tarefas podem ser marcadas como concluídas através de um botão de "check".
    - A descrição da tarefa agora pode ser visualizada na tela de lista.

### Parte 3: Integração com API Pública

- Foi implementada uma função para fazer uma requisição HTTP para a API pública [Cat Facts API](https://catfact.ninja/fact), que retorna um fato aleatório sobre gatos.
- Um botão foi adicionado para permitir que o usuário carregue um novo fato.
- A tela exibe um "loading" enquanto a requisição é feita, e possíveis erros, como falha de conexão, são tratados.

  - **Funcionalidade**:
    - A tela exibe um fato sobre gatos.
    - O botão "Get New Fact" permite ao usuário carregar um novo fato de gato.

---

