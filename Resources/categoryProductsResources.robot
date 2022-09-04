*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${MENU_MAIS_VENDIDOS}         //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${NOME_CATEGORIA}             //h2[@class='a-carousel-heading a-inline-block'][contains(.,'Mais Vendidos em Eletrônicos')]
${BTN_ADD_CARRINHO}           add-to-cart-button
${NAO_OBRIGADO}               //input[contains(@aria-labelledby,'a-autoid-3-announce')]
${ADICIONADO_NO_CARRINHO}     //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${CARRINHO}                   nav-cart

*** Keywords ***
Clicar no menu "Mais vendidos"
     Click Element                    locator=${MENU_MAIS_VENDIDOS}
     Element Should Be Visible        locator=${NOME_CATEGORIA}

Clicar no link "Ver mais" da categoria "Mais Vendidos em Eletrônicos"
     Click Link                       locator=//a[contains(@aria-label,'Mais Vendidos em Eletrônicos - Ver mais')]
     Wait Until Element Is Visible    locator=//h1[contains(.,'Mais Vendidos em Eletrônicos')]

Clicar no produto "${PRODUTO}" 
     Wait Until Element Is Visible    locator=//div[@class='_p13n-zg-list-grid-desktop_truncationStyles_p13n-sc-css-line-clamp-3__g3dy1'][contains(.,'${PRODUTO}')]
     Click Element                    locator=//div[@class='_p13n-zg-list-grid-desktop_truncationStyles_p13n-sc-css-line-clamp-3__g3dy1'][contains(.,'${PRODUTO}')]
     
Adicionar o produto "${PRODUTO}" no carrinho e rejeitar os produtos recomendados
     Wait Until Element Is Visible    locator=${BTN_ADD_CARRINHO}
     Click Button                     locator=${BTN_ADD_CARRINHO}
     Sleep  2s
     Wait Until Element Is Visible    locator=${NAO_OBRIGADO} 
     Click Button                     locator=${NAO_OBRIGADO} 

Verificar se o produto "${PRODUTO}" foi adicionado no carrinho e validar subtotal de item 
     Wait Until Element Is Visible        locator=${ADICIONADO_NO_CARRINHO}
     Click Link                           locator=${CARRINHO}
     Wait Until Element Is Visible        locator=//span[@class='a-truncate a-size-medium'][contains(.,'${PRODUTO}')]
     Element Text Should Be               locator=sc-subtotal-label-buybox    expected=Subtotal (1 item):                   

# GHERKIN STEPS

E que seleciono o produto "Echo Dot (3ª Geração)" no menu "Mais Vendidos em Eletrônicos" 
     Clicar no menu "Mais vendidos"
     Clicar no link "Ver mais" da categoria "Mais Vendidos em Eletrônicos"
     Clicar no produto "Echo Dot (3ª Geração)"

Quando clico em adicionar o produto no carrinho
     Adicionar o produto "Echo Dot (3ª Geração)" no carrinho e rejeitar os produtos recomendados

Então devo visualizar o subtotal de 1 produto no carrinho de compras 
    Verificar se o produto "Echo Dot (3ª Geração)" foi adicionado no carrinho e validar subtotal de item 
    
