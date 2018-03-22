public class AccountProcessor {
    @future
    public static void countContacts(List<Id> recordIds)
    {
    	List<Account> accounts = new List<Account>();
    	
    	for(Id id : recordIds)
    	{
    		Integer totContacts = [Select count() from Contact Where AccountId = :id];
    		Account ac = [Select Id, Name, Number_of_Contacts__c from Account Where Id = :id];
    		ac.Number_of_Contacts__c = totContacts;
    		accounts.add(ac);
    	}

       	List<Database.SaveResult> results = Database.update(accounts, false);
       	
       	for(Database.SaveResult sr : results) {
            System.debug(sr.isSuccess());
        }
      	
   	
    }
}