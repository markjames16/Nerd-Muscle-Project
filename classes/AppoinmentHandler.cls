public class AppoinmentHandler {
    public static void createOpps(List <Appointment__c> newApps){
        List <Opportunity> oppsToAdd = new List <Opportunity>();
        
        for (Appointment__c app : newApps){
            if (app.Appointment_Status__c == 'Appointment Held') {
                Opportunity opp = new Opportunity();
                opp.Name = 'Please rename opportunity'+ ''+ Math.abs(Math.random());
                opp.AccountId = app.Account__c;
                opp.StageName = 'Proposal';
                opp.Appointment__c = app.Id;
                opp.CloseDate = Date.today().addDays(15);
                oppsToAdd.add(opp);
            }
        } 
        insert oppsToAdd;
        System.debug('Oppoirtunity added successfully');
    }
}