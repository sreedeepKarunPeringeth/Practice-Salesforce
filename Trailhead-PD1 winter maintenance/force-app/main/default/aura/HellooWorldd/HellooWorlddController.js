({
	dofun : function(component, event, helper) {
        var name = component.get('v.username');
        console.log('name: ',name);
        component.set('v.username','huii');
	},
    
    handleClick : function(component,even,helper) {
    
    	helper.changeLabel(component);
	}
})