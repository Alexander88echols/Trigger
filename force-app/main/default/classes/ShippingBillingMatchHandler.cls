public class ShippingBillingMatchHandler {
    public static void SBM(List<Customer__c> CSB){
        for(Customer__c cuz : CSB){
            if(cuz.Shipping_Address__c != null && cuz.Billing_Address__c == null){
                cuz.Billing_Address__c = cuz.Shipping_Address__c;
            }
        }
    }
}