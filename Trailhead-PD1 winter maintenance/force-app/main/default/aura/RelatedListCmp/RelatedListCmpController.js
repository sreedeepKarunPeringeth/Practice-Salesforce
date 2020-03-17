({
	myAction1 : function(component, event, helper) {
		var wtvr = component.find("myRelatedList");
        console.log("wtvrrr"+wtvr);
        $A.util.toggleClass(wtvr,"toggles");
	}
})