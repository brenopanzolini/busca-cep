defmodule Cep do

  defp fetch_viacep(cep) do
    "https://viacep.com.br/ws/#{cep}/json/" |> HTTPoison.get |> parser_response
  end

  defp parser_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    {_, json} = body |> JSON.decode

    if json["erro"] == true do
      {:error, "CEP não encontrado"}
    else
      endereco = %{:cep => json["cep"], :logradouro => json["logradouro"], :complemento => json["complemento"], :bairro => json["bairro"], :localidade => json["localidade"], :uf => json["uf"]}      
      {:ok, endereco}
    end
  end

  def buscar(cep) do
    cond do
      is_nil(cep) ->
        {:error, "CEP não pode ser nil"}
      !is_bitstring(cep) ->
        {:error, "CEP deve ser String"}
      String.trim(cep) == "" ->
        {:error, "CEP não pode ser vazio"}
      Regex.match?(~r/[^0-9]/, cep) ->
        {:error, "CEP deve conter apenas números"}
      String.length(cep) < 8 || String.length(cep) > 8 ->
        {:error, "CEP deve ter 8 caracteres"}
      true ->
        fetch_viacep(cep)
    end
  end

end