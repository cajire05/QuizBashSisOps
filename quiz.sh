#!/bin/bash

mostrar_menu() {
    echo "======================"
    echo "    QUIZ MATEMÁTICO"
    echo "======================"
    echo "1) Problemas de suma"
    echo "2) Problemas de resta"
    echo "3) Problemas de multiplicación"
    echo "4) Problemas de división"
    echo "9) Salir"
    echo -n "Elige una opción: "
}

problema_suma() {
    local a=$((RANDOM % 101))
    local b=$((RANDOM % 101))
    local correcta=$((a + b))
    local respuesta
    local intentos=1

    echo
    echo "Problema de suma"

    while [ $intentos -le 3 ]; do
        echo -n "¿Cuánto es $a + $b? "
        read respuesta

        if ! [[ "$respuesta" =~ ^[0-9]+$ ]]; then
            echo "Ingresa un número válido."
        elif [ "$respuesta" -eq "$correcta" ]; then
            echo "¡Correcto!"
            echo
            return
        else
            echo "Respuesta incorrecta."
        fi

        intentos=$((intentos + 1))
    done

    echo "Ya no quedan intentos."
    echo "La respuesta correcta era: $correcta"
    echo
}

problema_resta() {
    local a=$((RANDOM % 101))
    local b=$((RANDOM % 101))
    local correcta
    local respuesta
    local intentos=1
    local aux

    if [ $a -lt $b ]; then
        aux=$a
        a=$b
        b=$aux
    fi

    correcta=$((a - b))

    echo
    echo "Problema de resta"

    while [ $intentos -le 3 ]; do
        echo -n "¿Cuánto es $a - $b? "
        read respuesta

        if ! [[ "$respuesta" =~ ^[0-9]+$ ]]; then
            echo "Ingresa un número válido."
        elif [ "$respuesta" -eq "$correcta" ]; then
            echo "¡Correcto!"
            echo
            return
        else
            echo "Respuesta incorrecta."
        fi

        intentos=$((intentos + 1))
    done

    echo "Ya no quedan intentos."
    echo "La respuesta correcta era: $correcta"
    echo
}

problema_multiplicacion() {
    local a=$((RANDOM % 101))
    local b=$((RANDOM % 101))
    local correcta=$((a * b))
    local respuesta
    local intentos=1

    echo
    echo "Problema de multiplicación"

    while [ $intentos -le 3 ]; do
        echo -n "¿Cuánto es $a x $b? "
        read respuesta

        if ! [[ "$respuesta" =~ ^[0-9]+$ ]]; then
            echo "Ingresa un número válido."
        elif [ "$respuesta" -eq "$correcta" ]; then
            echo "¡Correcto!"
            echo
            return
        else
            echo "Respuesta incorrecta."
        fi

        intentos=$((intentos + 1))
    done

    echo "Ya no quedan intentos."
    echo "La respuesta correcta era: $correcta"
    echo
}

problema_division() {
    echo
    echo "Opción en desarrollo."
    echo
}

while true; do
    mostrar_menu
    read opcion

    case "$opcion" in
        1) problema_suma ;;
        2) problema_resta ;;
        3) problema_multiplicacion ;;
        4) problema_division ;;
        9)
            echo "Saliendo del programa..."
            exit 0
            ;;
        *)
            echo
            echo "Opción inválida."
            echo
            ;;
    esac
done