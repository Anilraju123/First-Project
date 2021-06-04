trigger ActiveContacts on Contact (After update) {
    List<Account> updateData = new List<Account>(); 
   // List<Account> acc = [select name, id, Active_Contacts__c,(select lastname, Active__c,AccountId from Contacts) from Account];
    List<Contact> cc = [select lastname, AccountId, Account.name, Active__c from Contact  where id in: Trigger.new];
    Set<id> ids = new Set<id>();
    for(Contact c :cc)
    {
        ids.add(c.AccountId);
    }
    
    List<Account> dd = [select name, id, Active_Contacts__c,(select lastname, Active__c,AccountId from Contacts) from Account where id in:ids];
    
    for(Account a : dd)
    { Integer count=0;
        for(Contact c : a.Contacts)
        {
           if(c.Active__c)
           {
               count++;
           }
        }
     a.Active_Contacts__c = count;
     updateData.add(a);
    } 
    if(Staticboolean.updatetrigger== true)
    {
        Staticboolean.updatetrigger= false;
        update updateData;
    } 
}