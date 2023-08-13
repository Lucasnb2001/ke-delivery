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