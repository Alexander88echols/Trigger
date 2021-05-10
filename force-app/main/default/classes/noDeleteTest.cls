@isTest
private class noDeleteTest{
    @isTest static void SFDeletiontest(){
        Storage_Facility__c NewSF = new Storage_Facility__c(name = 'TestDelete1', Facility_Number__c = 6, Capicity__c = 5);
        insert NewSF;
        Zombie__c Ted = new Zombie__c(Name = 'Ted', Number_of_Zombies__c = 1, Zombie_Destination__c = NewSF.Id, Zombie_Location__c = 'downtown');
        insert Ted;
        
        Test.startTest();
        try{
            Database.DeleteResult Dres = Database.delete(NewSF, true);// that true is to clarify all or none  
        }catch(exception e){
            System.debug(e); 
        }
        Test.stopTest();
    }
    
    
    //start of bulktesting
    @isTest static void bulkD(){
        List<Storage_Facility__c> SFList = new List<Storage_Facility__c>();
        List<Zombie__c> zList = new List<Zombie__c>();
        for(integer i = 0; i < 200; i++){
            Storage_Facility__c TestingSite = new Storage_Facility__c(name = 'TestingSite' + i, Facility_Number__c = 0, Capicity__c = 5);
            SFList.add(TestingSite);
        }
        insert SFList;
        for(Integer z = 0; z < 200; z++){
            Zombie__c TestZ = new Zombie__c(Name = 'Test' + z, Number_of_Zombies__c = 1, Zombie_Destination__c = SFList[z].id, Zombie_Location__c = 'downtown');
            zList.add(TestZ);
        }
        insert zList;
        
        Test.startTest();
        try{
            Database.DeleteResult[] bulktest = Database.delete(SFList, true);// that true is to clarify all or none
            for(Database.DeleteResult DD : bulktest){
                if(DD.isSuccess()){
                    system.debug('Facility was deleted');
                }else if(DD.isSuccess() == false){
                    for(database.Error falure : DD.geterrors()){
                        system.debug(falure.getStatusCode() + ':' + falure.getMessage());
                    }
                }
            }
        }catch(exception e){
            System.debug(e.getMessage());
            
        }
        Test.stopTest();
    }
    
}