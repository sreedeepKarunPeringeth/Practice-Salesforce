public with sharing class ContactTriggerHelper {

	public static void updateContactInAccount(){
		
		List<Contact> newContacts = Trigger.new;
		List<Account> accountList = new List<Account>();
		Map<Id,List<Contact>> contactAccount = new Map<Id,List<Contact>>();
		
		for(Contact c: newContacts){
        	if(contactAccount.keySet().contains(c.AccountId)){
            	contactAccount.get(c.AccountId).add(c);
            }
            else{
            	contactAccount.put(c.AccountId, new List<Contact>{c});
            }
           
        }
        List<Account> acnts = [Select Id,List_of_Contact_Names__c from Account where id in :contactAccount.keySet()];
        if(Trigger.isInsert){   
            	//accountList.add(new Account(id=c.AccountId,List_of_Contact_Names__c= + '; '+c.LastName));
        }
       update accountList;
     }
}