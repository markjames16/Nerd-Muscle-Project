trigger OpportunityTrigger on Opportunity (after update) {
    if (trigger.isAfter & trigger.isUpdate) {
        OpportunityHandler.createContracts(trigger.new);
    }
}