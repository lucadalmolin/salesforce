public class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String stAbb;
    
    public AddPrimaryContact(Contact record, String stateAbbreviation) {
        this.contact = record;
        this.stAbb = stateAbbreviation;
    }
    public void execute(QueueableContext context) {
    	List<Account> accounts = [select id, name from account where BillingState = :stAbb limit 200];
    	List<Contact> contacts = new List<Contact>();
    	
		for (Account account : accounts) {
			//clone obj
			Contact con = contact.clone();
			//relating to account obj
			con.AccountId = account.Id;
			contacts.add(con);
        }
        
        insert contacts;
    }
}