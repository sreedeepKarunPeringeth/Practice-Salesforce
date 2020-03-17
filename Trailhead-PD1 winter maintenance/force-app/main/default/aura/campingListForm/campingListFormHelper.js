({
	createItem  : function(component) {
		
        var event= component.get("v.newItem");
        var createEvent = component.getEvent("addItem");
        createEvent.setParams({"item":event});
        createEvent.fire();
        
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                           'Price__c': 0,'Packed__c': false });
	}
})