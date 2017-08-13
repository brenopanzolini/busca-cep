defmodule Cep.Test do
  use ExUnit.Case, async: true
 
  test "deve retornar erro ao informar CEP nil" do
    cep = nil

    resultado = Cep.buscar(cep)
    assert {:error, "CEP não pode ser nil"} == resultado
  end

  test "deve retornar erro ao informar CEP que não seja string" do
    cep = 01001000

    resultado = Cep.buscar(cep)
    assert {:error, "CEP deve ser String"} == resultado      
  end

  test "deve retornar erro ao informar CEP vazio" do
    cep = ""

    resultado = Cep.buscar(cep)
    assert {:error, "CEP não pode ser vazio"} == resultado
  end

  test "deve retornar erro ao informar CEP apenas com espaços" do
    cep = " "

    resultado = Cep.buscar(cep)
    assert {:error, "CEP não pode ser vazio"} == resultado
  end

  test "deve retornar erro ao informar CEP com menos de 8 caracteres" do
    cep = "1001000"

    resultado = Cep.buscar(cep)
    assert {:error, "CEP deve ter 8 caracteres"} == resultado
  end

  test "deve retornar erro ao informar CEP com mais de 8 caracteres" do
    cep = "010010000"

    resultado = Cep.buscar(cep)
    assert {:error, "CEP deve ter 8 caracteres"} == resultado
  end

  test "deve retornar erro ao informar CEP com caracteres não numéricos" do
    cep = "0100X000"

    resultado = Cep.buscar(cep)
    assert {:error, "CEP deve conter apenas números"} == resultado
  end

  test "deve retornar o endereço ao informar um CEP válido" do
    cep = "01010000"
    endereco = %{:cep => "01010-000", :logradouro => "Rua São Bento", :complemento => "até 318 - lado par", :bairro => "Centro", :localidade => "São Paulo", :uf => "SP"}

    resultado = Cep.buscar(cep)
    assert {:ok, endereco} == resultado
  end

  test "deve retornar não encontrado ao informar um CEP inválido" do
    cep = "99999999"

    resultado = Cep.buscar(cep)
    assert {:error, "CEP não encontrado"} == resultado
  end
end