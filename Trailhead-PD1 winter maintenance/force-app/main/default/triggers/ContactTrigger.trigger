trigger ContactTrigger on Contact (after insert,after update) {

	ContactTriggerHelper.updateContactInAccount();
}