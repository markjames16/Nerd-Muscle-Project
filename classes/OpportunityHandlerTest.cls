@isTest 
public class OpportunityHandlerTest {
    @isTest public static void createContractWhenOppStageUpdated() {
        //Create instabce for the look up field on subscription
        Subscription__c subs = new Subscription__c(Name = 'Gym Bro Membership');
		insert subs;
        //Create a sample bulk opportunity
        List <Opportunity> oppList = new List <Opportunity> ();
        for (Integer i=0;i<5;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'This is a test opportnity' + i;
            opp.StageName = 'Meet Client';
            opp.CloseDate = System.today();
            opp.Subscription__c = subs.Id;
            opp.Subscription_Term__c = 12;
            oppList.add(opp); 
        }
        //Do Test start & stop on DML
        Test.startTest();
        	insert opplist;
        
        List <Contract> contractList = new List <Contract>();
        for(Integer i=0;i<5;i++){
        	Contract cont = new Contract();
            cont.Status = 'Draft';
            cont.StartDate = System.today();
            cont.ContractTerm = 24;
            
        }
        insert contractList;
        
        for (Opportunity opp: oppList){
            opp.StageName ='Closed Won';
        }
        update oppList;
        Test.stopTest();
        
        List <Contract> updatedContracts = [SELECT Id,AccountId,Name,Status,Startdate,ContractTerm FROM Contract WHERE AccountId = :contractList[0].id];
        System.assert(contractList != NULL, 'Contract create successfully');
    }
}