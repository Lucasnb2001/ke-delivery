Adicionar observa��es sobre o pedido: Uma op��o que permite que o cliente envie observa��es para o restaurante sobre o pedido. Ex.: Remover cebola

Com o objetivo de evitar ingredientes inc�modos
Sendo o cliente "Jo�o"
Eu quero ser capaz de adiconar observa��es em um pedido em andamento

Scenario: Adiconar coment�rio "Sem Cebola" no pedido "15122023"
Given Eu estou na p�gina do pedido "15122023"
And O pedido atual tem o Status "Em Produ��o" e Valor Total "R$22,90"
And O item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"
When Adiciono a observa��o "Sem Cebola"
And Confirmo a observa��o
Then Eu continuo na p�gina do pedido "15122023"
And "Observa��es do pedido" � alterado para "Sem Cebola"
And Uma notifica��o de observa��o � enviada ao restaurante