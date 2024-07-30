contrasena="david"
archivoTareas="tareas.txt"  
while true; do
    read -p "Ingresa la contraseña: " inputContrasena

    if [[ "$inputContrasena" == "$contrasena" ]]; then
        echo "Contraseña correcta. Opciones:"
        echo "1. Ver tareas pendientes"
        echo "2. Agregar tarea"
        echo "3. Completar tarea"
        echo "4. Salir"
        read -p "Elige una opción: " opcion

        case $opcion in
            1)
                #creamos el archivo si no existe
                if [[ ! -f "$archivoTareas" ]]; then
                    touch "$archivoTareas"
                fi
                cat "$archivoTareas"
                ;;
            2)
                read -p "Agrega la tarea nueva: " nuevaTarea
                echo "$nuevaTarea" >> "$archivoTareas"
                ;;
            3)
                read -p "Ingresa la tarea completada: " cerrarTarea
                sed -i "${cerrarTarea}d" "$archivoTareas"
                ;;
            4)
                echo "Salir"
                break
                ;;
            *)
                echo "Opción no válida. Inténtalo de nuevo."
                ;;
        esac
    else
        echo "Contraseña incorrecta. Inténtalo de nuevo."
    fi
done
