trigger LeadTrigger on Lead (after insert) {
    if(trigger.isInsert){
	LeadHandler.createTask(trigger.new);
     }
}