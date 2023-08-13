Feature: Hist�rico de pedidos
    Sendo o usu�rio "Marcus" do tipo "Cliente"
    Eu quero visualizar meus pedidos feitos
    Para que eu possa acompanhar minhas compras no aplicativo


    Scenario 1: Visualizar os pedidos feitos nos �ltimos 10 dias (GUI)
        Given Eu estou na p�gina "Meus Pedidos"
        And � exibido o pedido "09072023" com data "09/07/2023" com Status "Em produ��o" e valor total "R$104,10"
        And � exibido o pedido "05052023" com data "05/05/2023" com Status "Cancelado" e valor total "R$83,92"
        And � exibido o pedido "03032023" com data "03/03/2023" com Status "Fnalizado" e valor total "R$57,33"
        And Hoje � dia "10/07/2023"
        When Eu solicito a exibi��o dos pedidos feitos nos "�ltimos 10 dias"
        Then Eu continuo na p�gina "Meus Pedidos"
        And � exibido o pedido "09072023" com data "09/07/2023" com Status "Cancelado" e valor total "R$104,10"

    Scenario 2: Visualizar um pedido em uma data inv�lida (GUI) 
        Given Eu estou na p�gina "Meus Pedidos"
        And � exibido o pedido "08062023" com data "08/06/2023" com Status "Em produ��o" e valor total "R$104,10"
        And � exibido o pedido "12092022" com data "12/09/2022" com Status "Finalizado" e valor total "43,22"
        And Hoje � dia "10/07/2023"
        When Eu solicito a exibi��o dos pedidos feitos na data "15/03/2024"
        Then Eu continuo na p�gina "Meus Pedidos"
        And � exibido uma mensagem de erro informando que a data � inv�lida
        And � exibido uma mensagem de erro informando que a data � inv�lida
        And O seletor de datas est� definido como "Todos os pedidos"
        And � exibido o pedido "08062023" com data "08/06/2023" com Status "Em produ��o" e valor total "R$104,10"
        And � exibido o pedido "12092022" com data "12/09/2022" com Status "Fnalizado" e valor total "43,22"

    Scenario 3: Acompanhar o pedido "15122023" (GUI)
        Given Eu estou na p�gina "Meus Pedidos"
        And � exibido o pedido "15122023" com data "15/12/2023" com Status "Em produ��o" e valor total "R$43,14"
        And � exibido o pedido "05032023" com data "05/03/2023" com Status "Finalizado" e valor total "44,22"
        When Seleciono o pedido "15122023"
        Then � exibida a p�gina do pedido "15122023"
        And � exibido o item "Macarronada" com quantidade definida para "1 Unidades" com valor  unit�rio de "R$43,14" e total "R$43,14"
        And � exbido o Status "Em produ��o"
        And � exbido a observa��o "Com molho extra"

    Scenario 3: Obter todos os pedidos feitos (SERVICE)
        Given PedidosService retorna uma lista de itens
        When uma requisi��o "GET" for enviada para "/pedidos"
        Then o status da resposta deve ser "200"
        And o JSON da resposta deve ser uma lista de itens
        And o pedido "09072023" com data "09/07/2023" com Status "Em produ��o" e valor total "R$104,10" est� na lista
        And o pedido "05052023" com data "05/05/2023" com Status "Cancelado" e valor total "R$83,92" est� na lista
        And o pedido "03032023" com data "03/03/2023" com Status "Fnalizado" e valor total "R$57,33" est� na lista

    Scenario 4: Obter pedido "15122023" (SERVICE)
        Given PedidosService retorna um pedido com id "15122023"
        When uma requisi��o "GET" for enviada para "/pedidos/15122023"
        Then o status da resposta deve ser "200"
        And o JSON da resposta deve conter o id "15122023"
        And o JSON da resposta deve conter o item "Macarronada" com quantidade definida para "1 Unidades" com valor  unit�rio de "R$43,14" e total "R$43,14"
        And o JSON da resposta deve conter o Status "Finalizado"
        And o JSON da resposta deve conter a data "15/12/2023"
        And o JSON da resposta deve conter a observa��o "Com molho extra"
        And o JSON da resposta deve conter valor total "R$43,14"
        And o JSON da resposta deve conter m�todo de pagamento "Cart�o de cr�dito VISA"
        And o JSON da resposta deve conter endere�o "Casa da Torre"
        And o JSON da resposta deve conter entregue por "Carlos"
        And o JSON da resposta deve conter feito por "Mama Mia Massas"

    Scenario 5: Obter pedido com c�digo inv�lido(SERVICE)
        Given PedidosService retorna um pedido com id "999999"
        When uma requisi��o "GET" for enviada para "/pedidos/999999"
        Then o status da resposta deve ser "404"
        And o JSON da resposta deve ser "Pedido n�o encontrado"