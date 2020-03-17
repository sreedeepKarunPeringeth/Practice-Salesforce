({
	handleApplicationEventHelper : function(component,event) {
		 	var action = component.get('c.getCntDetails');
        	var msgFrom = event.getParam("ContactId");
        	console.log('in nnnn: '+ msgFrom);
            action.setParams({cntId: msgFrom});
            action.setCallback(this,function(response){
                var state = response.getState(); 
                console.log('in nnnn + '+state);
                if(state === "SUCCESS"){
                    component.set('v.displayContact',response.getReturnValue());
                }
                else {
                    console.log('handle error !!! ');
                }
            });
            $A.enqueueAction(action);
	}
})