public class zCommissionHandler {
    /*public static void zombieCommission(){
        List<Zombie__c> zList = [SELECT Id, Acquiring_Employee__c FROM Zombie__c];
        List<Employee__c> EmplCommish = new List<Employee__c>();
        for(Zombie__c AZ : zList){
            for(Employee__c AE : [SELECT ID, Employee_comission__c FROM Employee__c] ){
                if(AZ.Acquiring_Employee__c == AE.Id){
                    AE.Employee_comission__c += 100;
                    EmplCommish.add(AE);
                }
            }                
        }
        Upsert EmplCommish;
    }*/        
    public static void zombieCommission(){
        List<Zombie__c> zlist = [SELECT Id FROM Zombie__c WHERE Acquired__c = true LIMIT 1];
        List<Employee__c> elist = [SELECT Id, Employee_comission__c FROM Employee__c WHERE Position_Title__c = 'Grabber'];
        
        for(Zombie__c z : zlist){
            for(Employee__c e : elist){

            		if(e.Employee_comission__c < 2000.00){
                    e.Employee_comission__c += 100.00;    
                }               
            }
        }
        upsert elist;
    }
}