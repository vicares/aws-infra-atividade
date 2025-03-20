# Atividade de conexão EC2 com RDS

## Descrição

Este trabalho faz parte dos pré-requisitos para a conclusão da disciplina Infraestrutura de Nuvem com AWS e a sua execução foi realizada por meio de acesso ao AWS academy.

## Objetivo

O objetivo desse trabalho era instanciar um EC2 e e um banco de dados gerenciado via RDS. para criar uma estrutura básica AWS, ambos com as devidas configurações dos grupos de segurança.

## Visão geral

Neste repositório estão contidos os arquivos referentes a construção de um preview de uma tela de login para um catálogo de jogos digitais, mas o foco da atual atividade era a utilização de ferramentas disponibilizadas pela AWS por em prática o que foi aprendido durante as aulas do curso de Engenharia da Computação.



## Passo a passo

### **Grupos de segurança**

Para a realização deste trabalho foram criados dois Security Groups (SG), um para o EC2 e o outro para o RDS.
- EC2: Foi criado o SG com chamado de aws_ssh e foram adicionadas regras de entrada para acesso HTTP através da porta 80 e acesso SSH através da porta 22.

![Texto alternativo](aws-infra-atividade/midia/aws_ssh.png)
aws-infra-atividade\midia

- 
### **Gerenciamento de Usuários**

- Listar usuários cadastrados (Admin)
- Deletar usuários (Admin)

### **Sistema de Comentários**

- Criar comentários vinculados a um usuário
- Listar comentários com nome de usuário

## Instalação e Execução

### **1. Clone o repositório**

```bash
git clone https://github.com/seu-usuario/catalogo-jogos-api.git
cd catalogo-jogos-api
```

### **2. Configure as variáveis de ambiente**

Crie um arquivo `.env` na raiz do projeto e defina as seguintes variáveis:

```env
JWT_SECRET=sua_chave_secreta
```

### **3. Suba os containers com Docker**

```bash
docker-compose up -d
```

### **4. Acesse o terminal do container em execução**

```bash
docker exec -it catalogo_jogos_api /bin/sh
```

### **5. Execute as migrações**

```bash
npx sequelize-cli db:migrate
```

O servidor estará rodando em `http://localhost:3001`.

## Verificando o pgAdmin

### **1. Acesse no navegador**

```bash
http://localhost:5050
```
### **2. Coloque as informações de acesso**

**Login:** `admin@email.com`

**Senha:** `admin`

### **3. Adicionar Novo Servidor**

 1) Vá em Adicionar Novo Servidor
 2) De um nome para o servidor
 3) Vá em conexão e preencha com os seguintes dados:

- `Host: db`
- `Port: 5432`
- `Database: postgres`
- `Username: postgres`
- `Senha: postgres`
  
 4) Salve as alterações
 
### **4. Visualização das tabelas**

Para ver as tabelas e informações do banco de dados siga os seguintes passos:

`Servers -> seu_banco_de_dados -> Bancos de dados -> catalogo_jogos -> Esquemas -> Tabelas -> botão direito na tabela desejada -> Visualizar/Editar dados -> Primeiras 100 linhas`
 
## Rotas da API

### **Usuários**

- `POST /register` - Cria um novo usuário
- `POST /index` - Autentica um usuário
- `GET /users` - Lista todos os usuários (Admin)
- `DELETE /users/:id` - Remove um usuário (Admin)

### **Comentários**

- `POST /comments` - Adiciona um comentário
- `GET /comments` - Lista todos os comentários

## Melhorias Futuras

- Aprimorar o front end para uma melhor estilização
- Implementar upload de imagem de perfil
- Melhorar a interface do usuário
- Criar sistema de likes nos comentários
- Adicionar jogos reais com links e informações
- Criar botão de logout

## Autor

Desenvolvido por [Victor Soares](https://github.com/vicares) 🚀
