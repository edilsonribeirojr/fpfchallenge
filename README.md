# Desafio Técnico FPF Tech - Flutter

Este é o repositório para o Desafio Técnico FPF Tech - Flutter. O desafio foi dividido em quatro partes e, até agora, completamos as duas primeiras. O objetivo é criar uma aplicação Flutter para gerenciar tarefas, armazenar dados localmente e permitir a alternância de status entre "Pendente" e "Concluída".

## Parte 1: Lógica de Tarefas

A primeira parte consistiu em criar uma função que processa uma lista de tarefas, retornando:

- O menor número (menor tarefa em termos de ID).
- O maior número (maior tarefa em termos de ID).
- A soma de todos os números (soma dos IDs das tarefas).

Essa função foi criada com sucesso e testada, e a implementação está disponível no diretório `lib/utils`.

## Parte 2: Interface do Usuário

Na segunda parte do desafio, a tarefa foi criar uma interface de usuário com Flutter para gerenciar tarefas, permitindo ao usuário:

- Visualizar uma lista de tarefas.
- Marcar as tarefas como "Concluída" ou "Pendente".
- Adicionar novas tarefas.
- Visualizar o nome e a descrição das tarefas.

### Requisitos:
- Tela Inicial: A tela exibe uma lista de tarefas mockadas (com nome e status). Cada tarefa possui uma checkbox que pode ser marcada para alternar entre "Concluída" e "Pendente".
- Tela de Adição de Tarefa: O usuário pode adicionar novas tarefas, informando o nome da tarefa (obrigatório) e uma descrição (opcional).
- O status das tarefas é atualizado de forma dinâmica ao clicar na checkbox.

### Funcionalidade Adicional:
- As tarefas são armazenadas localmente usando o pacote `shared_preferences`.
- O status de cada tarefa pode ser alterado clicando na checkbox ao lado de cada tarefa, alternando entre "Pendente" e "Concluída".

### Como rodar a aplicação:
1. Execute o projeto com o comando:

   ```bash
   flutter run
O aplicativo será iniciado em seu dispositivo ou emulador com a tela inicial, onde você poderá ver a lista de tarefas e interagir com a aplicação.

Instruções para rodar o projeto:
Certifique-se de ter o Flutter instalado em sua máquina.

Abra o terminal e navegue até o diretório do projeto.

Use o comando flutter run para rodar o aplicativo.

Conclusão
A primeira e segunda partes do desafio foram concluídas com sucesso. A aplicação agora permite gerenciar tarefas, visualizar suas descrições e alternar seu status de forma simples e eficiente.

O projeto será expandido nas próximas partes, com mais funcionalidades e melhorias planejadas.

Tecnologias Usadas
Flutter: Framework para criar interfaces de usuário nativas.

Dart: Linguagem usada para desenvolver o aplicativo.

SharedPreferences: Armazenamento local de dados simples no dispositivo.