trigger Accountupdate on Account (After update) {
    
    List<Contact> newc = New List<Contact>();
    if(Trigger.isUpdate && Trigger.isAfter)
    {
        List<Account> acc = [select name, id, (select lastname, phone from Contacts), phone from Account where id IN: Trigger.New];
        for(Account a : acc)
        {
            for(Contact c : a.Contacts)
            {
               c.Phone = a.Phone; 
                update c;
            }
        }
        
        //if(TriggerControl.a == true)
       // {
        //    TriggerControl.a = false;
        //  update newc;
            
       // }
        
    }

}