trigger HelloWorldTrigger on Account (before insert) {
   
   for(Account account: Trigger.new){
        System.debug(String.format('Before Insert Account name {0}', new String[] { account.Name }));
     }
      
}