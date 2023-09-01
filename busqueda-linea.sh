#!/bin/bash

# Colores ANSI
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
ROJO='\033[0;31m'
NC='\033[0m' # No Color

# Pedir al usuario la palabra a buscar
read -p "Escribe la palabra que quieres buscar: " palabra_a_buscar

# Pedir al usuario el nombre del archivo
read -p "Escribe el nombre del archivo en el que quieres buscar: " archivo

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo ""
    echo -e "${ROJO}El archivo $archivo no existe${NC}"
    echo ""
    exit 1
fi

# Inicializar la variable para contar el número de veces que se encuentra la palabra
contador=0
echo ""
# Bucle que lee línea por línea desde el archivo especificado en la variable $archivo
while IFS= read -r linea; do
    # Incrementa el contador de número de líneas
    numero_linea=$((numero_linea + 1))
    
    # Comprueba si la línea contiene la palabra buscada ($palabra_a_buscar)
    if [[ "$linea" == *"$palabra_a_buscar"* ]]; then
        # Muestra un mensaje indicando que la palabra fue encontrada en la línea actual
        echo -e "${AMARILLO}La palabra buscada ${NC} ${VERDE}$palabra_a_buscar${NC} ${AMARILLO}ha sido encontrada en la línea${NC} ${VERDE}$numero_linea${NC}: $linea"
        # Imprime una línea en blanco para separar las coincidencias
        echo ""
        # Incrementa el contador de coincidencias
        contador=$((contador + 1))
    fi
done < "$archivo"


echo "==================================================================================="
echo ""

# Mostrar el número total de veces que se encontró la palabra
if [ "$contador" -eq 0 ]; then
    echo -e "${ROJO}La palabra${NC} ${VERDE}$palabra_a_buscar${NC} ${ROJO}no se ha encontrado ninguna vez${NC}"
    echo ""
elif [ "$contador" -eq 1 ]; then
    echo -e "${AMARILLO}La palabra${NC} ${VERDE}$palabra_a_buscar${NC} ${AMARILLO}se encontró un total de${NC} ${VERDE}$contador${NC} ${AMARILLO}vez.${NC}"
    echo ""
else
    echo -e "${AMARILLO}La palabra${NC} ${VERDE}$palabra_a_buscar${NC} ${AMARILLO}se encontró un total de${NC} ${VERDE}$contador${NC} ${AMARILLO}veces.${NC}"
    echo ""
fi
