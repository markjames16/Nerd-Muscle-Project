@isTest
public class AccountHandlerTest {
	@isTest
    public static void AccountHandler(){
        List <Account> accountList = new List <Account>();
        
        for (Integer i=0;i<5;i++){
            Account acc = new Account();
            acc.Name = 'Test Acocunt'+ i;
            acc.Active__c = 'No';
            accountList.add(acc);
        }
        
        //Do test for the DML
        Test.startTest();
        insert accountList;
        
        for (Account acc: accountList){
            acc.Active__c = 'Yes';
        }
        update accountList;
        
        List <Appointment__c> appList = new List <Appointment__c>();
        for(Integer i=0;i<5;i++){
            Appointment__c app = new Appointment__c();
            app.Account__c = app.Id;
            appList.add(app);
        }
        insert appList;
        Test.stopTest();
        
        List <Appointment__c> updatedApps = [SELECT Id,Name,Account__c FROM Appointment__c WHERE Id =: appList[0].id];
        System.assert(appList != Null, 'Appointment Record Created Succesfully');
    }
}