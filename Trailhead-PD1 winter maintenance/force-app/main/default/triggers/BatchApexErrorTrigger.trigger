trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {

    List<BatchLeadConvertErrors__c> l = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent event : Trigger.New){
        
        BatchLeadConvertErrors__c rec = new BatchLeadConvertErrors__c();
        rec.AsyncApexJobId__c = event.AsyncApexJobId;
        rec.Records__c = event.JobScope;
        rec.StackTrace__c = event.StackTrace;
        
        l.add(rec);
    }
    if(l.size() > 0){
    	insert l;    
    }
    
}