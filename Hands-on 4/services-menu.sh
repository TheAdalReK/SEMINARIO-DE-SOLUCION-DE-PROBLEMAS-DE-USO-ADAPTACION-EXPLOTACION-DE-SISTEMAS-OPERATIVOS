listar_contenido() {
    read -p "Ingrese la ruta absoluta del fichero: " ruta
    ls "$ruta"
}
crear_archivo() {
    read -p "Ingrese el texto a almacenar en el archivo: " texto
    echo "$texto" > nuevo_archivo.txt
    echo "Archivo creado correctamente."
}
comparar_archivos() {
    read -p "Ingrese la ruta absoluta al primer archivo: " archivo1
    read -p "Ingrese la ruta absoluta al segundo archivo: " archivo2
    diff "$archivo1" "$archivo2"
}
uso_awk() {
    echo "El comando awk permite procesar y manipular texto de forma avanzada en la línea de comandos."
    echo "Por ejemplo, para imprimir la primera columna de un archivo CSV:"
    echo "awk -F ',' '{print \$1}' archivo.csv"
}
uso_grep() {
    echo "El comando grep se utiliza para buscar patrones en archivos de texto."
    echo "Por ejemplo, para buscar la palabra 'hola' en un archivo:"
    echo "grep 'hola' archivo.txt"
}
while true; do
    echo "-------- Services Menu --------"
    echo "1. Listar contenido de un fichero"
    echo "2. Crear un archivo de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar el uso de awk"
    echo "5. Mostrar el uso de grep"
    echo "6. Salir"

    read -p "Ingrese su opción: " opcion

    case $opcion in
        1)
            listar_contenido
            ;;
        2)
            crear_archivo
            ;;
        3)
            comparar_archivos
            ;;
        4)
            uso_awk
            ;;
        5)
            uso_grep
            ;;
        6)
            echo "Saliendo del menú."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, elija una opción válida."
            ;;
    esac
done
