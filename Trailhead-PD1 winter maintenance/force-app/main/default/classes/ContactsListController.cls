public class ContactsListController {

    private String sortValue= 'lastName';
    
    public List<Contact> getWhatEver(){
        
        //List<Contact> result = [Select id,firstName, lastName, email, Title from Contact order by lastName];
        List<Contact> result = Database.query('Select id,firstName, lastName, email, Title from Contact order by  ' + sortValue);
        return result;
    }
    
    public void sortByFirstName(){
        this.sortValue= 'firstName';
    }
    
    public void sortByLastName(){
        this.sortValue= 'lastName';
    }
}