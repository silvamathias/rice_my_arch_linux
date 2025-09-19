#!/bin/bash

#### EXECUTA O MATUGEM PARA GERAR A PALHETA DE CORES BASEADA NO PAPEL DE PAREDE ATUAL
matugen image $1

#### EXECUTA O GTK PARA RECOLOCAR O TEMA ESCOLHIDO
bash ~/.config/hypr/scripts/gtk.sh

#### SALVA A IMAGEM USADA COMO PAPEL DE PAREDE EM LOCAL CONHECIDO E
#### COM O MESMO NOME PARA SER USADO PELO 'WLOGOUT'
$(cp $1 ~/.config/wlogout/icons/wpp.jpg)

#### USA A PALHETA DE CORES GERADA ACIMA PARA CRIAR .CSS COM VARIAVEIS DE COR PARA 
#### SEREM USADA EM UM HTML E FACILITAR 
#### A VISUALIZAÇÃO DA PALHETA
(echo ":root {" > ~/.config/waybar/cor.css)

IFS=$'\n' #mudar a variável de ambiente IFS de separação para troca de linha

for i in $(awk '{print $2, $3}' ~/.config/waybar/colors.css | grep ";")
    do
        a=$(echo "$i" | cut -d ' ' -f 1)
        b=$(echo "$i" | cut -d ' ' -f 2)

        (echo --$a: $b >> ~/.config/waybar/cor.css)
    done

(echo "}" >> ~/.config/waybar/cor.css)
IFS=' ' # Restaura o IFS padrão


