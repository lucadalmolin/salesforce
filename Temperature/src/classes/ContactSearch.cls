public class ContactSearch {

    public static List<Contact> searchForContacts (String lastName, String postalCode)
    {
        List<Contact> cts = [SELECT Account.Name 
                             FROM Contact 
                 			 WHERE LastName = :lastName OR 
                             MailingPostalCode = :postalCode];
        
        return cts;
    }
    
}