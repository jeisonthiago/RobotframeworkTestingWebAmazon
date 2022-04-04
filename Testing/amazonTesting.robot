*** Settings ***
Documentation     Essa suíte testa a busca de um produto e o subtotal adicionados no 
...               carrinho do site da Amazon.com.br
Resource          ../Resources/categoryProductsResources.robot
Resource          ../Resources/homeWebResources.robot
Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador      

*** Test Cases ***
Caso de Teste 01 - Validar produto adicionado no carrinho 
    [Documentation]    Esse teste foi criado para validar o fluxo de pesquisa e compra 
    ...                verificando o subtotal de pedidos adicionados no carrinho
    [Tags]             smoker       
    Dado que acesso a home page da Amazon.com.br
    E que seleciono o produto "Echo Dot (3ª Geração)" no menu "Mais Vendidos em Eletrônicos" 
    Quando clico em adicionar o produto no carrinho
    Então devo visualizar o subtotal de 1 produto no carrinho de compras 

    