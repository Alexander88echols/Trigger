trigger ZcommissionTrigger on Zombie__c (after update) {
	    zcommissionHandler.zombieCommission();
}