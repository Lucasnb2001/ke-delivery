Com o objetivo de personalizar meu pedido
Sendo o cliente "Cl�ber"
Eu quero ser capaz de editar os itens em um pedido em andamento

Scenario: Remover item "Salsa" do Carrinho de compras
Given de Compras"
And � exibido item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"
And "1 Unidades" com valor  unit�rio de "R$2,00" e total "R$2,00"
When Removo o item "Salsa"
And Confirmo a remo��o
Then Eu continuo na p�gina "Carrinho de Compras"
And � exibido item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"

Scenario: Remover item "Salsa" do Carrinho de compras
Given Eu estou na p�gina "Carrinho de Compras"
And � exibido item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"
And � exibido item "Azeite" tem quantidade definida para "1 Unidades" com valor  unit�rio de "R$2,00" e total "R$2,00"
When Removo o item "Azeite"
And Confirmo a remo��o
Then Eu continuo na p�gina "Carrinho de Compras"
And � exibido item "P�o de Alho" tem quantidade definida para "5 Unidades" com valor  unit�rio de "R$5,00" e total "R$25,00"
