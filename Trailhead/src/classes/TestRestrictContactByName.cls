@isTest
private class TestRestrictContactByName {
    
    @isTest static void testInvalidName()
    {
    	Contact contact = new Contact(LastName = 'INVALIDNAME');
    	
    	//insert contact;
    	
    	Test.startTest();
        Database.SaveResult result = Database.insert(contact, false);
        Test.stopTest();
    	
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
    }
    
    @isTest static void testValidName()
    {
    	Contact contact = new Contact(LastName = 'VALIDNAME');
    	
    	System.debug('Test');
    	
    	insert contact;
    	
    	Contact actContact = [select Id from contact where Id = :contact.Id];
    	
        System.assertEquals(contact.Id,actContact.Id);
    }
    
}