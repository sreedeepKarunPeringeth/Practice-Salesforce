({
	handleApplicationEvent : function(component, event, helper) {
        var msgFrom = event.getParam("ContactId");
        console.log('msgFrom: '+msgFrom);
        helper.handleApplicationEventHelper(component,event);
	}
})