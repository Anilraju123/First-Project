public class AddData 
{
  //we need add @Auraenabled for the fuction which we want to use in our Aura component.
@AuraEnabled
    public static void createrecord(String a, String b)
    {
        Newapp__c c = new Newapp__c(FirstName__c = a, Lastname__c = b );
        insert c;
        String l ='succes';
      //  return l;
    }
}