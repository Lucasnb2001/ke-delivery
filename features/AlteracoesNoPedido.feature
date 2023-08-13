Feature: Altera��es no Pedido
	Com o objetivo de ter uma experi�ncia melhor de compra
	Sendo a usu�ria "Maria" do tipo "Cliente"
	Eu quero ser capaz de modificar um pedido

	Scenario 1: Cancelar o pedido "090720231430" (GUI)
		Given Eu estou na p�gina do pedido "090720231430"
		And O pedido atual tem o Status "Em Produ��o" e Valor Total "R$104,10"
		And O item "Poke" tem quantidade definida para "2 Unidades" com valor  unit�rio de "R$30,10" e total "R$60,20"
		And O item "Sashimi" tem quantidade definida para "1 Unidade" com valor unit�rio de "R$43,90" e total "R$43,90"
		When Eu cancelo o pedido
		Then Eu continuo na p�gina do pedido "090720231430"
		And o status do pedido "090720231430" � alterado para "Cancelado"
		And Uma notifica��o de cancelamento � enviada ao restaurante

	Scenario 2: Remover item "Salsa" do Carrinho de compras (GUI)
		Given eu estou na p�gina "Carrinho de Compras"
		And � exibido item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"
		And � exibido o item "Azeite" que tem qauntidade definida para "1 Unidades" com valor  unit�rio de "R$2,00" e total "R$2,00"
		When Removo o item "Salsa"
		And Confirmo a remo��o
		Then Eu continuo na p�gina "Carrinho de Compras"
		And � exibido item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"

	Scenario 3: Adiconar coment�rio "Sem Cebola" no pedido "15122023" (GUI)
		Given Eu estou na p�gina do pedido "15122023"
		And O pedido atual tem o Status "Em Produ��o" e Valor Total "R$22,90"
		And O item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"
		When Adiciono a observa��o "Sem Cebola"
		And Confirmo a observa��o
		Then Eu continuo na p�gina do pedido "15122023"
		And Observa��es do pedido � alterado para "Sem Cebola"
		And Uma notifica��o de observa��o � enviada ao restaurante

	Scenario 4 : Adiconar coment�rio "Adicione 3 molhos da casa" em um pedido j� conclu�do (GUI)
		Given Eu estou na p�gina do pedido "10052023"
		And O pedido atual tem o Status "FinalizadoCapriche no tomate" e Valor Total "R$22,90"
		And O item "Pizza de Marguerita G" tem quantidade definida para "1 Unidades" com valor  unit�rio de "R$33,00" e total "R$33,00"
		And "Observa��es do pedido" tem valor ""
		When Adiciono a observa��o "Sem Cebola"
		And Confirmo a observa��o
		Then Eu continuo na p�gina do pedido "10052023"
		And Uma mensagem de erro � exibida informando que n�o � poss�vel adicionar observa��es
		And "Observa��es do pedido" exibe ""

	Scenario 5: Adiconar coment�rio "Remova os picles" no pedido "0001" (SERVICE)
        Given PedidosService cont�m um pedido com id "0001"
        When uma requisi��o "PUT/0001/:obs:" for enviada para "/pedidos/0001/:obs" com o corpo da requisi��o sendo um JSON com a observa��o "Remova os picles"
        Then o status da resposta deve ser "200"
        And o JSON da resposta deve ser "Remova os picles"
		
	Scenario 6: Adiconar coment�rio "Capriche no tomate" no pedido "9999" (SERVICE)
        Given PedidosService cont�m um pedido com id "0001"
        When uma requisi��o "PUT/9999/:obs:" for enviada para "/pedidos/9999/:obs" com o corpo da requisi��o sendo um JSON com a observa��o "Capriche no tomate"
        Then o status da resposta deve ser "404"
        And o JSON da resposta deve ser "Pedido n�o encontrado"
