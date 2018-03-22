trigger ExampleTrigger on Account (after delete, after insert) {
   
        if (Trigger.isInsert) {
            Integer recordCount = Trigger.New.size();
            
            for(Account account: Trigger.new){
                System.debug(String.format('Before Insert Account name {0}', new String[] { account.Name }));
                
            // Call a utility method from another class
            //EmailManager.sendMail('luca.dalmolin@gmail.com', 'Trailhead Trigger Tutorial', 
                        //recordCount + ' contact(s) were inserted.Contact:' + account.Name);
                
            }
            
        }
        else if (Trigger.isDelete) {
            // Process after delete
        } 
        
}