({
    controllerAction : function(component,event,helper) {
        helper.fetchAllContacts(component,event,helper);
        
	},
    handleClick : function(component,event,helper){
        helper.handleClickHelper(component,event,helper);
    },
    handleFireEvent : function(component,event,helper){
    	helper.handleFireEventHelper(component,event,helper);
	}
  
})