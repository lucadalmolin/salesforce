@RestResource(urlMapping='/MyAccount/*')
global with sharing class MyRestResource {

    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
  
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        
        System.debug(String.format('Get Account {0}', new String[] { accountId }));
        
        return result;
    }
  
  /*
  @HttpPost
    global static String doPost(String name,
        String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.website = website;
        insert account;
        return account.Id;
    }
    */
    
    @HttpPost
    global static String doPost() {
    	RestRequest req = RestContext.request;
    	String jsonString = req.requestBody.toString();
    	Account account = (Account) JSON.deserialize(jsonString, Type.forName('Account'));
    	insert account;
    	System.debug(String.format('Inserted Account {0}', new String[] { account.Id }));
    	return account.Id;    	
    }
    
}