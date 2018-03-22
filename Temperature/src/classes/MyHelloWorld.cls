public class MyHelloWorld {
// This method updates the Description field for a list
// of accounts to read "Hello World".
public static void addHelloWorld(Account[] accs){
	for (Account a:accs){
		if (String.isEmpty(a.Description))
			a.Description = 'Hello World first class from client.';
		}
	}
}