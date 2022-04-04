*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}                    chrome 
${URL}                        http://www.amazon.com.br
${MENU_MAIS_VENDIDOS}         //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]

*** Keywords ***
Abrir navegador
     Open Browser     browser=${BROWSER}

Fechar navegador
     Capture Page Screenshot
     Sleep  2s
     Close Browser

Dado que acesso a home page da Amazon.com.br
     Go To           url=${URL}
     Wait Until Element Is Visible     locator=${MENU_MAIS_VENDIDOS}

