({
	clickCreateItem : function(component, event, helper) {
		 var validList= component.find('campForm').reduce(function (validSoFar,inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        
        if(validSoFar){
        	helper.createItem(component);
        }
	}
})