#!/bin/bash
##########################################################################
#### EM DESUSO. O CODIGO FUNCIONA MAS FOI COPIADO PARA DENTRO DO A #######
#### RQUIVO SET_EALLPAPER.SH PARA QUE FUNCIONASSE JUNTO COM O WAYPAPER ###
##########################################################################
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