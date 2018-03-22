public class AccountHandler {

    public static Account insertNewAccount(String name)
    {
        Account ac = new Account(Name = name);
        Database.SaveResult result = Database.insert(ac, false);
        if (result.isSuccess()) {
        	// Operation was successful, so get the ID of the record that was processed
        	System.debug('Successfully inserted contact. Contact ID: ' + result.getId());
    	} else {
        	// Operation failed, so get all errors
        	ac = null;
            for(Database.Error err : result.getErrors()) {
                System.debug('Description of the following error that has occurred.');
                System.debug(err.getStatusCode() + ': ' + err.getMessage());
                System.debug('Contact fields that affected this error: ' + err.getFields());
                
         	}
		}
        return ac;
    }
}
