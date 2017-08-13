defmodule Cep do

  defp get_endpoint(cep) do
    "https://viacep.com.br/ws/#{cep}/json/" 
  end

  def buscar(cep) do
    cond do
      is_nil(cep) -> {:error, "CEP não pode ser nil"}
      !is_bitstring(cep) -> {:error, "CEP deve ser String"}
      String.trim(cep) == "" -> {:error, "CEP não pode ser vazio"}
      Regex.match?(~r/[^0-9]/, cep) -> {:error, "CEP deve conter apenas números"}
      String.length(cep) < 8 || String.length(cep) > 8 -> {:error, "CEP deve ter 8 caracteres"}
    end
  end

end