public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer totContacts, String lastName)
	{
		List<Contact> contacts = new List<Contact>();
		for (Integer j=0;j<totContacts;j++) {
			Contact contact = new Contact(FirstName = String.format('FirstName {0}', new String[] { String.valueOf(j) }),
										  LastName = lastName);
			contacts.add(contact);
		}
		
		return contacts;
		
	}
    
}