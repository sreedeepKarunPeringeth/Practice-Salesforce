trigger AccountTrigger on Account (before delete, after insert,before insert,before update) {

    if(Trigger.isBefore && Trigger.isDelete)
    	AccountUtils.noAccountDeletion(Trigger.Old);
    
    if(Trigger.isAfter && Trigger.isInsert)
        AccountUtils.createInvoice(Trigger.New);
    
    if(Trigger.isBefore && Trigger.isInsert)
        AccountUtils.updateAcntName(Trigger.New);
    
    if(Trigger.isBefore && Trigger.isUpdate)
        AccountUtils.updateOpportunityTypeValues(Trigger.New);
}