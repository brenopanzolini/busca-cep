defmodule App.Cep do

  def get_endpoint(cep) do
    "https://viacep.com.br/ws/#{cep}/json/" 
  end

  def buscar(cep) do
    cond do
      is_nil(cep) -> {:error, "CEP não pode ser nil"}
      String.trim(cep) == "" -> {:error, "CEP não pode ser vazio"}
      String.length(cep) < 8 || String.length(cep) > 8 -> {:error, "CEP deve ter 8 caracteres"}
      !is_integer(cep) -> {:error, "CEP deve conter apenas números"}
    end
  end

end