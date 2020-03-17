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
           /* var camp= component.get("v.newItem");
            var campLists = component.get("v.Items");
            campLists.push(JSON.stringfy(camp));
            component.set("v.Items",campLists);
            component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                       'Price__c': 0,'Packed__c': false });
        */
        helper.createItem(component);
        }
	},
    
    doInit: function(componenet,event,helper){
        
        var action= component.get("c.getItems");
        action.setCallBack(this,function(response){
            if(response.getState() == "SUCCESS"){
				component.set("v.items",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    handleAddItem: function(component, event, helper) {
    var addItm = event.getParam("item");
    helper.createItem(component, addItm);

},

    createItem: function(component, newItem) {
    var action = component.get("c.saveItem");
    action.setParams({
        "item": newItem
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
        }
    });
    $A.enqueueAction(action);
}
    
})