trigger OpportunityForAccountntWithContacts on Opportunity (before insert, before update) {
	
    if(Trigger.isUpdate)
    	OppUtility.checkStageAndRelatedContacts(Trigger.New);
    else
   		OppUtility.checkRelatedContacts(Trigger.New);
	
}