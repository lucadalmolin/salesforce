@isTest
private class TestRandomContactFactory {
	
    @isTest
    private static void testTotalCreateContacts()
    {
    	Integer totContacts = 100;
    	String lastName = 'LastName';
    	List<Contact> contacts = RandomContactFactory.generateRandomContacts(totContacts, lastName);
    	System.assertEquals(totContacts, contacts.size());
    }
    
    @isTest
    private static void testValueCreateContacts()
    {
    	Integer totContacts = 100;
    	String lastName = 'LastName';
    	String firstName = 'FirstName 10';
    	List<Contact> contacts = RandomContactFactory.generateRandomContacts(totContacts, lastName);
    	System.assertEquals(firstName, contacts.get(10).FirstName);
    }
    
}