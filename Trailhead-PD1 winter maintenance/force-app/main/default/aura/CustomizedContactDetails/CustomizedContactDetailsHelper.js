({
	helperAction : function(component,event) {
		
        var action = component.get('c.getCntDetails');
        action.setParams({cntId: component.get('v.contactIdValue')});
        action.setCallback(this,function(response){
        	var state = response.getState(); 
            if(state === "SUCCESS"){
                component.set('v.displayContacts',response.getReturnValue());
            }
            else {
                console.log("handle error !!! ");
            }
        });
        $A.enqueueAction(action);
	},
    
    handleClickHelper : function(component,event,helper){
         helper.helperAction(component,event);
	},
    
    fetchAllContacts : function(component,event) {
        
        var action = component.get('c.getAllContacts');
        action.setCallback(this,function(response){
        	var state = response.getState(); 
            if(state === "SUCCESS"){
                component.set('v.allContacts',response.getReturnValue());
            }
            else {
                console.log('error in fetching all contacts');
            }
        });
        $A.enqueueAction(action);
    },
    
    handleFireEventHelper : function(component,event) {
        var appEvent = $A.get("e.c:myEvent");
        var nam = component.find("InputSelectDynamic").get("v.value");
        console.log('read from cmp,nam '+ nam);
        appEvent.setParams({"ContactId":nam});
        appEvent.fire();
    }
})