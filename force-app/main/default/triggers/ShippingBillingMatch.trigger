trigger ShippingBillingMatch on Customer__c (before insert) {
	ShippingBillingMatchHandler.SBM(Trigger.new);
}