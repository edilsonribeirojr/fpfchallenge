Desafio Técnico - FPF Tech - Flutter
Visão Geral
Este projeto tem como objetivo criar uma aplicação Flutter com funcionalidades de gerenciamento de tarefas, utilizando o Flutter para Web. Ele segue um processo de desenvolvimento dividido em várias etapas, sendo cada uma implementada e testada de forma incremental.

Passo 1 - Desenvolvimento de Funcionalidades de Gerenciamento de Tarefas
O primeiro passo do projeto consistiu no desenvolvimento das funcionalidades de gerenciamento de tarefas, que incluem:

Adicionar novas tarefas: O usuário pode adicionar tarefas à lista com um nome e descrição opcional.

Alterar o status das tarefas: As tarefas podem ser alternadas entre os status de "Pendente" e "Concluída".

Persistência das tarefas: As tarefas são salvas localmente usando o SharedPreferences, o que garante que as alterações feitas pelo usuário sejam persistidas entre as sessões.

Além disso, o Passo 1 incluiu a criação de testes unitários para garantir que as funcionalidades de gerenciamento de tarefas funcionem corretamente. A estrutura de testes foi implementada com o flutter_test e cobre as operações principais, como adição e alteração de status de tarefas.

Passo 2 - Aplicação Flutter Web
O segundo passo foi a criação da aplicação Flutter, que foi projetada para rodar diretamente no navegador. A aplicação inclui:

Interface de usuário: Uma interface simples com lista de tarefas, onde o usuário pode ver o nome e o status de cada tarefa.

Ações de navegação: Adição de tarefas em uma segunda página

Persistência no navegador: O uso do SharedPreferences para garantir que as tarefas sejam armazenadas e carregadas corretamente entre as sessões do navegador.

A aplicação foi construída para ser responsiva e interativa, com foco em uma experiência fluida no navegador.

Passo 3 - Interação com API

No terceiro passo, a interação com a API foi adicionada junto da aplicação do Passo 2 para melhopr visualização dos dados.

Por fim, os três passos foram integrados ao fluxo geral da aplicação, e a navegação agora permite ao usuário acessar facilmente todas as páginas.


Como Inicializar o Projeto
Pré-requisitos
Certifique-se de ter o Flutter SDK instalado em seu sistema. Você pode baixá-lo aqui: Flutter SDK.

Um navegador moderno, como Google Chrome, para rodar a aplicação Flutter Web.

Editor de código (recomendado: Visual Studio Code ou Android Studio).

Passo a Passo

Clone o repositório:

git clone https://github.com/edilsonribeirojr/fpfchallenge.git

Navegue até o diretório do projeto:

cd FPF_Project
Instale as dependências:
No diretório do projeto, execute o seguinte comando para instalar as dependências:

flutter pub get

Inicie o servidor da aplicação Flutter Web:

Para rodar a aplicação no navegador, execute o seguinte comando:

flutter run -d chrome

A aplicação será aberta automaticamente no navegador padrão e estará pronta para ser utilizada.

Testes Unitários

Para garantir que todas as funcionalidades estejam funcionando corretamente, o projeto inclui testes unitários que validam a lógica do passo 1. Para rodar os testes:

No diretório do projeto, execute:

flutter test

Os testes irão verificar a adição de tarefas, a alternância de status e a persistência no armazenamento local (SharedPreferences).

Funcionalidades Implementadas

Página de Tarefas: Exibe uma lista de tarefas com a possibilidade de adicionar, editar e alternar o status (Pendente/Concluída).

Página de Números: Exibe informações sobre números específicos.

Página de Gatos: Exibe curiosidades sobre gatos.

Licença
Este projeto está licenciado sob a Licença MIT.
