public class SmsMessage {
    
    public static String send(String fromNbr, String toNbr, String msg)
    {
    	String currentMsg = String.format('Sending msg: {0}{1}', new List<String> { fromNbr, toNbr, msg});
    	System.debug(currentMsg);
    	return 'success';
    }
    
}