trigger noDeleteSF on Storage_Facility__c (before delete) {
	noDeleteSFHandler.noDelete(trigger.old);
}