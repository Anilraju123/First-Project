({
	init : function(component, event, helper) {
		//cmp.set('v.userid', "ANil");
        var compevent = component.getEvent("event1");
        compevent.setParams({ name1 : "WELLCOME TO REGISTRATION"});
        compevent.fire();
        
       
	},
    
    new1 : function(component, event, helper) {
         var m = event.getParam("name2");
        component.set('v.passvalue2', m);
        
    }
});