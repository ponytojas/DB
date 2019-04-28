package com.asdv.pl3;

class DBCalls {

    String getStringToShow(int call){
        String selectedItem ;
        String columnsNames;
        String separator = "=============================================================\n";
        switch (call){
            case 0:
                selectedItem = "Grupos de Jazz\n";
                columnsNames = "id_grupo\tnombre_grupo\tgenero_grupo\n";
                break;
            case 1:
                selectedItem = "Musicos Bateria\n";
                columnsNames = "nombre_musico\tapellido_musico\n";
                break;

            case 2:
                selectedItem = "Saxofonistas de Jazz\n";
                columnsNames = "nombre_musico\tapellido_musico\n";
                break;

            case 3:
                selectedItem = "Grupos con conciertos en España\n";
                columnsNames = "nombre_grupo\n";
                break;

            case 4:
                selectedItem = "Discos de mas de 10 canciones\n";
                columnsNames = "titulo_disco\n";
                break;

            case 5:
                selectedItem = "Grupos de mas de 3 miembros\n";
                columnsNames = "nombre_grupo\n";
                break;

            case 6:
                selectedItem = "Opiniones de usuarios que hayan comprado al menos tres discos\n";
                columnsNames = "titulo_disco\tpuntuacion\n";
                break;

            case 7:
                selectedItem = "Discos de vinilo con al menos una cancion de mas de 5 minutos\n" +
                        "Grabado por un grupo de Rock\n";
                columnsNames = "titulo_disco\n";
                break;

            case 8:
                selectedItem = "Musicos con conciertos en España con entradas de mas de 100€\n";
                columnsNames = "dni_musico\tnombre_musico\tapellidos_musico\tdireccion_musico\tnumero_telefono\n";
                break;

            case 9:
                selectedItem = "Opiniones de usuarios que hayan ido a \n" +
                        "conciertos en España con entradas de mas de 100€\n";
                columnsNames = "puntuacion\n";
                break;

            case 10:
                selectedItem = "Canciones y compositores de discos de Heavy Metal de 2018\n";
                columnsNames = "id_cancion\tnombre_cancion\tduracion\tnombre_musico\tapellidos_musico\n";
                break;

            case 11:
                selectedItem = "Guitarristas de grupos de Jazz y " +
                        "los discos a la venta en formato digital junto a su tamaño en MB\n";
                columnsNames = "nombre_musico\tapellidos_musico\ttitulo_disco\ttamaño_disco(MB)\n";
                break;

            case 12:
                selectedItem = "Usuarios que hayan comprado entradas de conciertos de Rock\n" +
                        "de 2018 y hayan emitido opiniones\n";
                columnsNames = "nombre_usuario\tapellidos_usuario\n";
                break;

            case 13:
                selectedItem = "Discos y titulos de canciones con opiniones superiores a 8\n";
                columnsNames = "titulo_disco\tnombre_cancion\n";
                break;

            case 14:
                selectedItem = "Nombre de grupos y musicos que no hayan dado conciertos en España\n" +
                        "y con discos de mas de 10 canciones\n";
                columnsNames = "nombre_grupo\tnombre_musico\tapellidos_musico\n";
                break;


            case 15:
                selectedItem = "Canciones y grupos que no hayan dado conciertos en 2017\n";
                columnsNames = "nombre_cancion\tnombre_musico\tapellidos_musico\n";
                break;

            default:
                return "Not correct call";
        }
        return separator + selectedItem + columnsNames + separator;
    }

    int amountOfResults(int call) {
        switch (call) {
            case 3:
            case 4:
            case 5:
            case 7:
            case 9:
                return 1;

            case 1:
            case 2:
            case 6:
            case 12:
            case 13:
                return 2;

            case 0:
            case 14:
                return 3;

            case 11:
                return 4;

            case 8:
            case 10:
            case 15:
                return 5;

            default:
                return 0;
        }
    }

    String getTableSelection(int call, int iteration){
        switch (call){
            case 0:
                switch (iteration) {
                    case 0:
                        return "id_grupo";
                    case 1:
                        return "nombre_grupo";
                    case 2:
                        return "genero_grupo";
                }

            case 1:
            case 2:
                switch (iteration) {
                    case 0:
                        return "nombre_musico";
                    case 1:
                        return "apellidos_musico";
                }

            case 3:
            case 5:
                return "nombre_grupo";

            case 4:
            case 7:
                return "titulo_disco";

            case 6:
                switch (iteration){
                    case 0:
                        return "titulo_disco";
                    case 1:
                        return "puntuacion";
                }

            case 8:
                switch (iteration){
                    case 0:
                        return "dni_musico";
                    case 1:
                        return "nombre_musico";
                    case 2:
                        return "apellidos_musico";
                    case 3:
                        return "direccion_musico";
                    case 4:
                        return "numero_telefono";
                }

            case 9:
                return "puntuacion";

            case 10:
                switch (iteration){
                    case 0:
                        return "id_cancion";
                    case 1:
                        return "nombre_cancion";
                    case 2:
                        return "duracion";
                    case 3:
                        return "nombre_musico";
                    case 4:
                        return "apellidos_musico";
                }

            case 11:
                switch (iteration){
                    case 0:
                        return "nombre_musico";
                    case 1:
                        return "apellidos_musico";
                    case 2:
                        return "titulo_disco";
                    case 3:
                        return "tamaño_disco";
                }

            case 12:
                switch (iteration){
                    case 0:
                        return "nombre_usuario";
                    case 1:
                        return "apellidos_usuario";
                }

            case 13:
                switch (iteration){
                    case 0:
                        return "titulo_disco";
                    case 1:
                        return "nombre_cancion";
                }

            case 14:
                switch (iteration){
                    case 0:
                        return "nombre_grupo";
                    case 1:
                        return "nombre_musico";
                    case 2:
                        return "apellidos_musico";
                }

            case 15:
               switch (iteration){
                   case 0:
                       return "titulo_disco";
                   case 1:
                       return "nombre_cancion";
                   case 2:
                       return "nombre_grupo";
                   case 3:
                       return  "nombre_musico";
                   case 4:
                       return "apellidos_musico";
               }

            default:
                return "Not correct call";
        }
    }
}
