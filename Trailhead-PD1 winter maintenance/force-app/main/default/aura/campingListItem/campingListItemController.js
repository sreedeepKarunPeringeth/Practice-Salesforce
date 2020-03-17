({
	packItem : function(component, event, helper) {
		var a= component.get("v.item",true);
        a.Packed__c = true;
        component.set("v.item",a);
        event.getSource().set("v.disabled",true);
	},
    
    clickCreateItem : function(component,event,helper){
    	
        var validList= component.find('campForm').reduce(function (validSoFar,inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        
        if(validSoFar){
            var camp= component.get("v.newItem");
            var campLists = component.get("v.Items");
            campLists.push(JSON.stringfy(camp));
            component.set("v.Items",campLists);
            component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                       'Price__c': 0,'Packed__c': false });
        }
	}
})