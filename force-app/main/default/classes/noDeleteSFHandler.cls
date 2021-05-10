public class noDeleteSFHandler {
    public static void noDelete(List<Storage_Facility__c> SFND){
        for(Storage_Facility__c storage : SFND){
            if(storage.Current_Resident_Number__c != null){
                storage.addError('There are still Zombies in here, are you trying to cause an apocalypse');
            }
        }
    }
}