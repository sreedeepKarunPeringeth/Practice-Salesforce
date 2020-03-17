public with sharing class ContactDetailsController {

    @AuraEnabled
    public static List<Contact> getCntDetails(string cntId){
        system.debug('before cntList==: '+cntId);
        List<Contact> cntList = [Select id,name,Phone,AccountId,ContactId__c from Contact where ContactId__c = :cntId];
        system.debug('cntList==: '+cntList);
        return cntList;
    }
    
    @AuraEnabled
    public static List<Contact> getAllContacts(){
        
        system.debug('in method');
        List<Contact> cntList = [Select id,name from Contact];
        
        return cntList;
    }
}