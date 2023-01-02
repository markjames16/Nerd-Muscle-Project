trigger AccountTrigger on Account (after update) {
    if (trigger.isUpdate) {
	AccountHandler.createAppoinment(Trigger.new);
        }
}