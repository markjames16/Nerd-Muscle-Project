public class AccountHandler {
    public static void createAppoinment(List <Account> newList){
    	List <Appointment__c> newApps = new List <Appointment__c>();
        
        for (Account a :newList){
            if (a.active__c == 'Yes'){
                Appointment__c app = new Appointment__c();
                app.Account__c = a.Id;
                app.Client__c = a.Client__c;
                app.Appointment_Status__c = 'In Progress';
                newApps.add(app);
            }
        }
		insert newApps;   
        system.debug('Appointment was created succesfully');
    }
}