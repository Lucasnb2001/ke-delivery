Com o objetivo de Acompanhar meus gastos no aplicativo
Sendo a cliente "Clara"
Eu quero ser capaz de visualizar os pedidos feitos no aplicativo

Scenario: Visualizar os pedidos feitos nos �ltimos 10 dias
Given Eu estou na p�gina "Meus Pedidos"
And � exibido o pedido "09072023" com data "09/07/2023" com Status "Em produ��o" e valor total "R$104,10"
And � exibido o pedido "05052023" com data "05/05/2023" com Status "Cancelado" e valor total "R$83,92"
And � exibido o pedido "03032023" com data "03/03/2023" com Status "Fnalizado" e valor total "R$57,33"
And Hoje � dia "10/07/2023"
When Eu solicito a exibi��o dos pedidos feitos nos "�ltimos 10 dias"
Then Eu continuo na p�gina "Meus Pedidos"
And � exibido o pedido "09072023" com data "09/07/2023" com Status "Cancelado" e valor total "R$104,10"