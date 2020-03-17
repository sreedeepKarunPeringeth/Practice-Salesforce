public class checkConcept {

    static integer x= 10;
    {
        integer x = 3;
    }
    
    public static void main(){
        
         //integer x= 9;
        
        {
             system.debug('inner loop' + x);
            integer x = 11;
            system.debug('inner loop' + x);
            
        }
       // system.debug('outer loop' + x);
    }
}