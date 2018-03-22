trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    String stage = 'Closed Won';
    String taskSubject = 'Follow Up Test Task';
    List<Task> tasks = new List<Task>();
    
    //check Closed Won
   for(Opportunity opportunity : Trigger.New) {
        if(stage.equals(opportunity.StageName))
        {
            Task task = new Task(Subject = taskSubject, WhatId = opportunity.Id);
            tasks.add(task);
            System.debug(String.format('Adding task to opportunity: {0} ', new String[] { opportunity.Name }));
        }
   }
   
   if(tasks.size() > 0)
   {
        insert tasks;
   }
    
}