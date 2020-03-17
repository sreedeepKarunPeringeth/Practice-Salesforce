global class OpportunityCreatorBatch implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator('select Id from Opportunity');
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> scope){

        List<Opportunity> oppList = new List<Opportunity>();
        for(integer i= 1;i <= 250;i++){
            if(i == 170)
                oppList.add(new Opportunity(Name='FromBatchAgain '+ i,StageName='Prospecting',CloseDate=date.today()+10,AccountId='0010o00002J3j17AAB'));
            else
                oppList.add(new Opportunity(Name='FromBatchAgain '+ i,StageName='Prospecting',CloseDate=date.today()+10,AccountId='0010o00002EOTviAAH'));
        }
        system.debug('list: '+ oppList);
        database.insert(oppList,false);
    }    
    global void finish(Database.BatchableContext bc){
		 System.debug(' records processed. Shazam!');
    }    
    
}