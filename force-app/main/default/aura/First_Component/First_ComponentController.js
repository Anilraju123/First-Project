({
    handleClick : function (cmp, event, helper) {
      
        var a = cmp.get('v.value1');
        var b = cmp.get('v.value2');
      //  alert(a+" "+b);
        const action = cmp.get("c.createrecord");
        action.setParams({
            firstname : a,
            Lastname :  b              
        });
      //  alert("working till here");
        action.setCallback(this, function(response){
                      var state =response.getState();
            alert(state);
                           });
         $A.enqueueAction(action);
        
        var appevent = $A.get("e.c:SecondEvent");
        appevent.setParams({name2 : "Successsfully resgistered"});
        appevent.fire();
        alert("Successfully REgistered");
        cmp.set('v.userid', "ANIL RAJU");
        
    },
    init : function (cmp, event, helper) {
        /*var appevent = $A.get("e.c:SecondEvent");
        appevent.setParams({name2 : "Successsfully resgistered"});
        appevent.fire();
        cmp.set('v.userid', "ANIL RAJU");*/
        
    },
    new :function (cmp, event, helper){
    const value = event.getParam("name1");
    cmp.set("v.passvalue", value);
    
    
}
});