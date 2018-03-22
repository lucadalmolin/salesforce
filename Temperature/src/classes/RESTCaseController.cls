@RestResource(urlMapping='/RestContacts/*')
global with sharing class RESTCaseController {
    @HttpGet
    global static List<Contact> searchForContacts ()
    {
        //query parameter
        String lastName = RestContext.request.params.get('lastName');
        String postalCode = RestContext.request.params.get('postalCode');
        
        List<Contact> cts = [SELECT Account.Name 
                             FROM Contact 
                 			 WHERE LastName = :lastName OR 
                             MailingPostalCode = :postalCode];
        
        return cts;
    }    
}