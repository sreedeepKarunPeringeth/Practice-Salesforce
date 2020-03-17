public class AccountUtils {

    public static void noAccountDeletion(List<Account> accntList){
        
        for(Account acnt: accntList){
            if(acnt.description != 'delete this')
                acnt.addError('No account deletion allowed');
        }
    }
    public static void createInvoice(List<Account> accntList){
        
        List<Invoice__c> invoiceList = new List<Invoice__c>();
        for(Account acnt: accntList){
            invoiceList.add(new Invoice__c(Amount__c=0,Name=acnt.Name+' inv',Account__c=acnt.Id));
        }
        
        insert invoiceList;
    }
    
    public static void updateAcntName(List<Account> accntList){     
        for(Account acnt: accntList)
            acnt.Name = 'New ' + acnt.Name;
    }
    
     public static void updateOpportunityTypeValues(List<Account> accntList){     
        
         List<Account> acnList= [Select Id, Name, (Select id,Type from Opportunities) from Account where Id in :accntList];
         List<Id> newCustIds = new List<Id>();
         List<Id> existingCustIds = new List<Id>();
         system.debug('acnList--: '+ acnList.get(0).Opportunities);
         for(Account acnt: accntList){
             if(acnt.Type.equalsIgnoreCase('prospect')){
                 for(Opportunity op: acnt.Opportunities){
                     newCustIds.add(op.Id);
                 }
             }
             else{
                 for(Opportunity op: acnt.Opportunities){
                         existingCustIds.add(op.Id);
                     }
             }
         }
         
         List<Opportunity> oppList1 = new List<Opportunity>();
         for(Id i: newCustIds){
             oppList1.add(new Opportunity(Id=i,Type='New Customer'));
         }
		 List<Opportunity> oppList2 = new List<Opportunity>();
         for(Id i: existingCustIds){
             oppList2.add(new Opportunity(Id=i,Type='Existing Customer Upgrade'));
         }
         system.debug('newCust: '+ oppList1);
         system.debug('oldCust: '+ oppList2);
         insert oppList1;
         insert oppList2;
    }
}