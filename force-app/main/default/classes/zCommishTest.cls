@isTest
private class zCommishTest {
    @isTest static void zcomishless(){
        Storage_Facility__c NewSF = new Storage_Facility__c(name = 'TestDelete1', Facility_Number__c = 6, Capicity__c = 5);
        insert NewSF;
        Employee__c Matt = new Employee__c(Name = 'Matt', Employee_comission__c = 1800, Position_Title__c = 'Grabber');
        insert Matt;
		Zombie__c Ted = new Zombie__c(Name = 'Ted', Number_of_Zombies__c = 1,Acquiring_Employee__c = Matt.Id, Zombie_Destination__c = NewSF.Id, Zombie_Location__c = 'downtown');
        insert Ted;
        try{
            Ted.Acquired__c = True;
            update Ted;
            Matt.Employee_comission__c = 100;
            update Matt;
        }catch(exception e){
            system.debug(e.getMessage());
            system.assertEquals(100, Matt.Employee_comission__c);
        }
    } 
}