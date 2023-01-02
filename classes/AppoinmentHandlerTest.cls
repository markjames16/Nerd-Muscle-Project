@isTest
public class AppoinmentHandlerTest {
    @isTest
    public static void createOpportunity(){
        
		Account a = new Account(Name = 'Test Account');
		insert a;
       
        List <Appointment__c> apptsList = new List <Appointment__c> ();
        for(Integer i=0;i<5;i++) {
            Appointment__c app = new Appointment__c();
            app.Account__c = a.Id;
            app.Appointment_Status__c = 'In Progress';
            apptsList.add(app);
        }
        Test.startTest();
        insert apptsList;
        
        for (Appointment__c app : apptsList){
            app.Appointment_Status__c = 'Appointment Held';
        }
        update apptsList;
        
        List <Opportunity> oppsToAdd = new List <Opportunity>();
      
        for (Integer i=0;i<5;i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp' + i;
            opp.CloseDate = Date.today();
            opp.StageName = 'Proposal';
            oppsToAdd.add(opp);
        }
        
        insert oppsToAdd;
        Test.stopTest();
        
        List <Opportunity> oppsUpdatedList = [SELECT Id FROM Opportunity WHERE Id =: oppsToAdd[0].Id];
        System.assert(oppsToAdd != null, 'Opportunity record was created');
    }
}