defmodule App.Cep.Test do
  use ExUnit.Case, async: true
 
  test "deve retornar o endpoint com o CEP informado" do
    cep = "01001000"
    endpoint = App.Cep.get_endpoint(cep)

    assert "https://viacep.com.br/ws/#{cep}/json/" == endpoint
  end

  test "deve retornar erro ao informar CEP com menos de 8 caracteres" do
    cep = "1001000"
    resultado = App.Cep.buscar(cep)

    assert {:error, "CEP deve ter 8 caracteres"} == resultado
  end

  test "deve retornar erro ao informar CEP com mais de 8 caracteres" do
    cep = "010010000"
    resultado = App.Cep.buscar(cep)

    assert {:error, "CEP deve ter 8 caracteres"} == resultado
  end

  test "deve retornar erro ao informar CEP nil" do
    cep = nil
    resultado = App.Cep.buscar(cep)

    assert {:error, "CEP não pode ser nil"} == resultado
  end

  test "deve retornar erro ao informar CEP vazio" do
    cep = ""
    resultado = App.Cep.buscar(cep)

    assert {:error, "CEP não pode ser vazio"} == resultado
  end

  test "deve retornar erro ao informar CEP apenas com espaços" do
    cep = " "
    resultado = App.Cep.buscar(cep)

    assert {:error, "CEP não pode ser vazio"} == resultado
  end

  test "deve retornar erro ao informar CEP com caracteres não numéricos" do
    cep = "0100X000"
    resultado = App.Cep.buscar(cep)

    assert {:error, "CEP deve conter apenas números"} == resultado
  end

end