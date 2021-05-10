@isTest
public class ShippingBillingTest {
    @isTest static void SBtest(){
        Customer__c NewCus = new Customer__c(name = 'Jamie', Customer_Phone_number__c = '3234009898',
                                             Shipping_Address__c = 'the block', Billing_Address__c = null );
        
        try{
            insert NewCus;
        }catch(exception e){
            System.debug(e.getMessage());
            
        }
    }
}