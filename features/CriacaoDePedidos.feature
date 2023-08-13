Feature: Cria��o de Pedidos
	Com o objetivo de adquirir itens desejados
	Sendo o usu�rio "Jo�o" do tipo "Cliente"
	Eu quero ser capaz de efetivar um pedido

	Scenario 1: Finalizar compra (GUI)
		Given Eu estou na p�gina "Carrinho de compras"
		And � exibido o item "Macarronada" com quantidade definida para "2 Unidades" com valor  unit�rio de "25,00" e total "50,00"
		And o m�todo de pagamento selecionado � o "Cart�o de Cr�dito VISA"
		And o endere�o selecionado � "Casa na Torre"
		And cupons aplicatos tem valor ""
		When Eu confirmo o pedido
		Then � gerado um pedido com id "0001"
		And � exibida a p�gina do pedido "0001"
		And � exibido o item "Macarronada" com quantidade definida para "2 Unidades" com valor  unit�rio de "25,00" e total "50,00"
		And o status do pedido "0001" � "Aguardando confirma��o do Restaurante"
		And Uma notifica��o de novo pedido � enviada ao restaurante

	Scenario 2: Finalizar compra (Service)
		Given Pedidos cont�m os pedidos "0001" e "0002"
		When uma requisi��o "POST" for enviada para "/pedidos" com o corpo da requisi��o sendo um JSON com o id "0003"
		And o JSON deve ter item = {nome = "Tofu", quantidade = "2", VUnit = "R$10,00", VTot = "R$20,00"}
		And o JSON tem ValorTotal = "R$20,00"
		And o JSON tem Data = "25/09/2020"
		And o JSON tem Observacoes = ""
		Then o status da resposta deve ser "200"
		And o JSON da resposta deve conter o id "0003" 
		And o JSON deve ter item = {nome = "Tofu", quantidade = "2", VUnit = "R$10,00", VTot = "R$20,00"}
		And o JSON tem ValorTotal = "R$20,00"
		And o JSON tem Data = "25/09/2020"
		And o JSON tem Observacoes = ""