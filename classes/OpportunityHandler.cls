public class OpportunityHandler {
    public static void createContracts(List <Opportunity> newOppsList) {
        //Create list to hold the new contract records
        List <Contract> newContracts = new List <Contract>();

        for (Opportunity opp: newOppsList){
            if (opp.StageName == 'Closed Won'){
                //Create new contract record
                Contract cont = new Contract();
                cont.AccountId = opp.accountId;
                cont.Opportunity__c  = opp.Id;
                cont.CustomerSignedId = opp.Client__c;
                cont.CustomerSignedDate = System.today();
                cont.StartDate = System.today();
                cont.ContractTerm = integer.valueOf(opp.Subscription_Term__c);
                cont.Status = 'Draft';
                cont.Subscription__c = opp.Subscription__c;

                //Add contracts to the list
                newContracts.add(cont);
            }
        }
        //Insert contracts to the list
        insert newContracts;
    }
}