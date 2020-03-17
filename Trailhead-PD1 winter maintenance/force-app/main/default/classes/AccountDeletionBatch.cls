global class AccountDeletionBatch implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator('select Id from Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){

        List<Account> demoAccountList = new List<Account>();
        
        for(integer i= 1;i <= 201;i++){
            demoAccountList.add(new Account(Name='demo'+i,description= 'delete this'));
        }
        demoAccountList.add(new Account(Name='demo'+102));
        insert demoAccountList;
        database.delete(demoAccountList,false);
    }    
    global void finish(Database.BatchableContext bc){
		 System.debug(' records processed. Shazam!');
    }    
    
}