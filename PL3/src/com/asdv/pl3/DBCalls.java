package com.asdv.pl3;

public class DBCalls {

    String getStringToShow(int call){
        String separator = "============================\n";
        switch (call){
            case 0:
                String selectedItem = "Grupos de Jazz\n";
                return separator + selectedItem + separator;
            case 1:
                return "1";

            case 2:
                return "2";

            case 3:
                return "3";

            case 4:
                return "4";

            case 5:
                return "5";

            case 6:
                return "6";

            case 7:
                return "7";

            case 8:
                return "8";

            case 9:
                return "9";

            case 10:
                return "10";

            case 11:
                return "11";

            case 12:
                return "12";

            case 13:
                return "13";

            case 14:
                return "14";

            case 15:
                return "15";

            case 16:
                return "16";

            default:
                return "Not correct call";
        }
    }

    String getTableSelection(int call){
        switch (call){
            case 0:
                return "nombre_grupo" + "id_grupo";
            case 1:
                return "1";

            case 2:
                return "2";

            case 3:
                return "3";

            case 4:
                return "4";

            case 5:
                return "5";

            case 6:
                return "6";

            case 7:
                return "7";

            case 8:
                return "8";

            case 9:
                return "9";

            case 10:
                return "10";

            case 11:
                return "11";

            case 12:
                return "12";

            case 13:
                return "13";

            case 14:
                return "14";

            case 15:
                return "15";

            case 16:
                return "16";

            default:
                return "Not correct call";
        }
    }
}
