@RestResource(urlMapping='/testSharing/')
global class TestingSharing {

     @HttpGet
    global static Account doGet(){
        RestRequest request = RestContext.request;
        List<Account> acnt = [Select id, name from Account];
        
        System.debug(acnt);
         System.debug(acnt.size());
        
        return acnt.get(0);
    }
}