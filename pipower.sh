#!/bin/bash
#OPTS=$(getopt -q -a \
#    --options ${SORT} \
#    --longoptions ${LOPT} \
#    --name "$(basename "$0")" \
#    -- "$@"
#)
#################################################
# Help                                          #
#################################################

help()
{
        # Exibe o Help
        echo "Uso:"
        echo
        echo "Sintaxe: pipower.sh [-h|-sp|-lp|-r]"
        echo "Opções:"
        echo "-h   Exibe o Help"
        echo "--sp Simula pressionamento curto do botão de Power"
        echo "--lp Simula pressionamento longo do botão de Power"
        echo "-r   Simula pressionamento do botão de Reset"
        echo
}

#################################################
# Main                                          #
#################################################

while [[ $# > 0 ]]; do
        case ${1} in
                -h) # Exibe o Help
                        help
                        exit;;
                --sp) # Short Power
                        echo "Aguarde! Enviando pressionamento curto do botão de Power via GPIO"
                        raspi-gpio set 23 op dh;sleep 1;raspi-gpio set 23 op dl
                        echo "Pressionamento curto do botão de Power enviado"
                        echo
                        exit;;
                --lp) # Long Power
                        echo "Aguarde! Enviando pressionamento longo do botão de Power via GPIO"
                        raspi-gpio set 23 op dh;sleep 5;raspi-gpio set 23 op dl
                        echo "Pressionamento longo do botão de Power enviado"
                        echo
                        exit;;
                -r) # Reset
                        echo "Aguarde! Enviando pressionamento do botão de Reset via GPIO"
                        raspi-gpio set 24 op dh;sleep 1;raspi-gpio set 24 op dl
                        echo "Pressionamento do botão de Reset enviado"
                        echo
                        exit;;
                --);;
                *) # Opção inválida
                        echo "Opção inválida, favor observar as opções abaixo."
                        echo
                        help
                        exit;;
        esac
        shift
done

help
