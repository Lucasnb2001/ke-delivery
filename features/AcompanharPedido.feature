Acompanhar o estado de um pedido: Tela com informa��es sobre um pedido em espec�fico, informando qual o status, qual o valor, os itens, etc.

Com o objetivo de evitar gastos desnecess�rios
Sendo a cliente "Maria"
Eu quero ser capaz de cancelar um pedido que n�o desejo mais

Scenario: Cancelar o pedido "090720231430"
Given Eu estou na p�gina do pedido "090720231430"
And O pedido atual tem o Status "Em Produ��o" e Valor Total "R$104,10"
And O item "Poke" tem quantidade definida para "2 Unidades" com valor  unit�rio de "R$30,10" e total "R$60,20"
And O item "Sashimi" tem quantidade definida para "1 Unidade" com valor unit�rio de "R$43,90" e total "R$43,90"
When Eu cancelo o pedido
Then Eu continuo na p�gina do pedido "090720231430"
And o status do pedido "090720231430" � alterado para "Cancelado"
And Uma notifica��o de cancelamento � enviada ao restaurante