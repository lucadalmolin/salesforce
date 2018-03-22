@IsTest
private class AccountProcessorTest {
    @IsTest
    private static void testCountContacts()
    {
    	    	
    	// Test data setup
        // Create one account with one opportunity by calling a utility method
        Account[] accts = TestDataFactory.createAccountsWithContacts(10,5);
        
        //get one Id
        Id accId = accts.get(5).Id;
        
        List<Id> accounts = new List<Id>(new Map<Id, Account>([select Id from Account]).keySet());
		
		System.debug('accounts:' + String.valueOf(accounts.size()));
    	
    	Test.startTest();
    	
  		AccountProcessor.countContacts(accounts);
		
    	Test.stopTest();
    	
    	Decimal totContacts = [Select count() from Contact Where AccountId = :accId];
    	
    	System.debug('totContacts:' + String.valueOf(totContacts));
    	
    	Account actualAccount = [Select Id,Number_of_Contacts__c from Account where Id = :accId];
    	Decimal actualContacts = actualAccount.Number_of_Contacts__c;
    	
    	System.debug('actualContacts:' + String.valueOf(actualContacts));
    	
    	System.assertEquals(totContacts,actualContacts);
    	
    }
}