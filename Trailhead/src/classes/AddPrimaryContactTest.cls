@isTest
private class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        
        // insert 50 accounts
        for (Integer i=0;i<50;i++) {
            accounts.add(new Account(name='Account '+ i, 
                BillingState = 'NY'));
        }
        
        // insert 50 accounts
        for (Integer i=50;i<100;i++) {
            accounts.add(new Account(name='Account '+ i, 
                BillingState = 'CA'));
        }
        
        insert accounts;
        
        //insert a contact
        Contact contact = new Contact(LastName = 'Dal Molin');
        insert contact;
        
        
    }
    
    @isTest
    static void testQueble() {
        Contact contact = [select id, FirstName, LastName from contact where LastName = 'Dal Molin'];
        System.debug('Check lastname:' + contact.LastName);
        // Create our Queueable instance
        AddPrimaryContact inserter = new AddPrimaryContact(contact, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(inserter);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from contact where Account.BillingState = 'CA' and LastName like '%Dal%']);
    }
}