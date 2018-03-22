@isTest
public class AccountHandlerTest {
 
    @isTest static void testAccount() {
     String testName = 'This is a Test';
     Account ac = AccountHandler.insertNewAccount(testName);
     System.assertEquals(testName, ac.Name);
 	}
    
    @isTest static void testNullAccount() {
     String testName = null;
     Account ac = AccountHandler.insertNewAccount(testName);
     System.assertEquals(null, ac);
 	}
    
}