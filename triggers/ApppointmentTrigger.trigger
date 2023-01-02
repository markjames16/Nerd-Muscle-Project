trigger ApppointmentTrigger on Appointment__c (after update) {
    if(Trigger.isUpdate && Trigger.isAfter){
	AppoinmentHandler.createOpps(Trigger.new);
   }
}