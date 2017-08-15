# Busca CEP - Elixir

Busca por CEP integrado ao ViaCEP para ser utilizado em projetos Elixir.

## Como Utilizar

1. Clone o projeto

```sh
$ git clone https://github.com/brenopanzolini/busca-cep.git
$ cd busca-cep/app
```

2. Instale as dependências necessárias

```sh
/busca-cep/app$ mix deps.get
```

3. Teste utilizando o **iex**

```sh
/busca-cep/app$ iex -S mix

iex(1) > Cep.buscar("01310200")``