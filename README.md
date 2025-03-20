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
- EC2: Foi criado o SG com chamado de `aws_ssh` e foram adicionadas regras de entrada para acesso HTTP através da porta 80 e acesso SSH através da porta 22.

![Erro ao carregar imagem.](/midia/aws_ssh.png)

- RDS: Foi criado o SG chamando de `aws-rds`, ele foi configurado com regra de entrada dando acesso a porta 5432 do PostgreSQL e para ter apenas a `aws_ssh` como fonte.


![Erro ao carregar imagem.](/midia/aws-rds.png)

### **Configuração da Key Pair**

Para a configuração da chave SSH foi dado o nome `aws_aula02` e foram marcadas as opções `RSA` e `.pem`. 

![Erro ao carregar imagem.](/midia/chave_ssh.png)

### **Configuração do EC2**

A instância foi nomeada de `infra_aws_atividade01`. Para a sua configuração, foram selecionadas as opções:

- `Amazon Linux`
- `t2.micro`
- `aws_aula02`
- `aws_ssh`
- `LabInstanceProfile`

![Erro ao carregar imagem.](/midia/EC2_01.png)

![Erro ao carregar imagem.](/midia/EC2_02.png)

![Erro ao carregar imagem.](/midia/EC2_03.png)

![Erro ao carregar imagem.](/midia/EC2_04.png)

### **Configuração do RDS**

O  RDS foi nomeado de `infra_aws_atividade01`. Para a sua configuração, foram selecionadas as opções:

- `Standard Create`
- `PostgreSQL`
- `PostgreSQL 17.2-R1`
- `Free tier`
- `Nome: postgres`
- `Senha: *************`
- `Security Group: aws-rds`
- `nome inicial: catalogo_jogos`

![Erro ao carregar imagem.](/midia/RDS01.png)

![Erro ao carregar imagem.](/midia/RDS02.png)

![Erro ao carregar imagem.](/midia/RDS03.png)

![Erro ao carregar imagem.](/midia/RDS04.png)

![Erro ao carregar imagem.](/midia/RDS05.png)

## Execução da atividade

- Foi utilizado um terminal WSL2 emulando um Ubuntu no Windows 10 por meio do comando:

  ```wsl.exe -d Ubuntu```

- A conexão foi realizada a partir da chave SSH criada. por meio do comando:

  ``` ssh -i "aws_aula02.pem" ec2-user@ec2-98-81-213-43.compute-1.amazonaws.com ```

Já o teste de conexão com o banco de dados foi feito por meio do Netcat com o comando:

  ```nc -zv aws-db.c1dzzl7szzye.us-east-1.rds.amazonaws.com 5432```


## Autor

Desenvolvido por [Victor Soares](https://github.com/vicares) 🚀
