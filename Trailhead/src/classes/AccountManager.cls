@RestResource(urlMapping='/account/*/contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the accId from the end of the URL
        String accId = request.requestURI.replace('/contacts','');
		accId = accId.substring(accId.lastIndexOf('/') + 1);
        Account result =  [SELECT Id,Name,
        				(select Id,Name from contacts)
                        FROM Account
                        WHERE Id = :accId];
        return result;
    }
     
}