Acompanhar o estado de um pedido: Tela com informa��es sobre um pedido em espec�fico, informando qual o status, qual o valor, os itens, etc.

Com o objetivo de acompanhar o meu pedido
Sendo o cliente "Henrique"
Eu quero ser capaz de acompanhar o status do meu pedido

Scenario: Acompanhar o pedido "15122023"
Given Eu estou na p�gina "Meus Pedidos"
And � exibido o pedido "15122023" com data "15/12/2023" com Status "Em produ��o" e valor total "R$43,14"
And � exibido o pedido "05032023" com data "05/03/2023" com Status "Finalizado" e valor total "44,22"
When Seleciono o pedido "15122023"
Then � exibida a p�gina do pedido "15122023"
And � exibido o item "Macarronada" com quantidade definida para "1 Unidades" com valor  unit�rio de "R$43,14" e total "R$43,14"
And � exbido o Status "Em produ��o"
And � exbido a observa��o "Com molho extra"