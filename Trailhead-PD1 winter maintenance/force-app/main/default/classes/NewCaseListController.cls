public class NewCaseListController {

    private String filterValue = 'new';
    public List<Case> getNewCases(){
        
       // List<Case> result= Database.query('Select Id, caseNumber from Case where status = '+ filterValue);
        List<Case> result= [Select Id, caseNumber from Case where status = 'new'];
        return result;
    }
}