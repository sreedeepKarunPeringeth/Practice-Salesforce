public class OppUtility {

    public static void checkStageAndRelatedContacts(List<Opportunity> newOppList){
    
        for(Opportunity opp: newOppList){
            if(opp.StageName.equalsIgnoreCase('Qualification')){
                checkRelatedContacts(newOppList);
            }
        }
    }
    
    public static void checkRelatedContacts(List<Opportunity> newOppList){
        
        Map<Id,List<Opportunity>> mapOppWithAcntId = new Map<Id,List<Opportunity>>();
        
        for(Opportunity opp: newOppList){
            if(opp.AccountId != null){
                if(mapOppWithAcntId.containsKey(opp.AccountId))
                	mapOppWithAcntId.get(opp.AccountId).add(opp);
            	else
                    mapOppWithAcntId.put(opp.AccountId,new List<Opportunity>{opp});
            }
            else
                opp.addError('Oppurtunity should have an account associated.');
        }

        List<Account> result = 
            [SELECT (SELECT Name FROM Contacts) FROM Account WHERE Id in :mapOppWithAcntId.keySet() ];
    	
        for(Account a: result){
             if(a.contacts.size() < 1){
                 for(Opportunity opp: mapOppWithAcntId.get(a.Id)){
                     opp.addError('Account has no related contacts');
                 }
            }
        }    
    }
}