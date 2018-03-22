trigger AccountAddressTrigger on Account (before insert, before update) {
   
   for(Account account : Trigger.New) {
        if(!String.isEmpty(account.BillingPostalCode) && account.Match_Billing_Address__c)
        {
            account.ShippingPostalCode = account.BillingPostalCode;
            System.debug(String.format('ShippingPostalCode updated fo Account name: {0} ', new String[] { account.Name }));
        }
   }
    
}