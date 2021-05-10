@isTest
private class noDeleteTest{
    @isTest static void SFDeletiontest(){
        Storage_Facility__c NewSF = new Storage_Facility__c(name = 'TestDelete1', Facility_Number__c = 6, Capicity__c = 5);
        insert NewSF;
		Zombie__c Ted = new Zombie__c(Name = 'Ted', Number_of_Zombies__c = 1, Zombie_Destination__c = NewSF.Id, Zombie_Location__c = 'downtown');
        insert Ted;
        
        Test.startTest();
        try{
          Database.DeleteResult Dres = Database.delete(NewSF, true);  
        }catch(exception e){
           System.debug(e); 
           //system.assertEquals(e.getMessage(),true); 
        }
        Test.stopTest();
        //String d = string.valueOf(Dres.getErrors()[1]);
        
        
        //system.debug(Dres);
        /*List<Storage_Facility__c> SFTList = new List<Storage_Facility__c>();
        for(integer i = 0; i < 200; i++){
            Storage_Facility__c SF = new Storage_Facility__c(Name = 'testing' + i);
            SFTList.add(SF);
            insert SFTList;
            test.startTest();
        }*/
    }
}