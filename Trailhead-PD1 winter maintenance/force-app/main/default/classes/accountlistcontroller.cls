Public class accountlistcontroller{
    public list<account> getaccounts(){
        return [SELECT Id, name FROM Account ];     
    }
}