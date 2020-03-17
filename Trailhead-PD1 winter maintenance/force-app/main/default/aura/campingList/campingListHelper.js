({
	createItem : function(component){
        
        var action= component.get("c.saveitem");
        action.setParams({
            "item": item
        });
        action.setCallBack(this,function(){
            
            if(response.getState() == "SUCCESS"){
                var campLists = component.get("v.Items");
                campLists.push(JSON.stringfy(response.getReturnValue()));
                component.set("v.Items",campLists);
                component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                           'Price__c': 0,'Packed__c': false });
            }
        });
        $A.enqueueAction(action);
    }})