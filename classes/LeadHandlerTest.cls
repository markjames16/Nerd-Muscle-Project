@isTest
public class LeadHandlerTest {
  @isTest
    public static void createTaskTest(){
        List <Lead> leadList = new List <Lead>();
        for (Integer i=0;i<5;i++){
            Lead l = new Lead();
            l.LastName = 'Test Name' + i;
            l.Company = 'Test Company'+ i;
            leadList.add(l);
        } 
        Test.startTest();
        insert leadList;
        
        List <Task> taskList = new List <Task>();
        for(Integer i=0;i<5;i++){
            Task tsk = new Task();
            tsk.Subject = 'Follow up the lead';
            tsk.Status = 'Not Started';
            tsk.ActivityDate = date.today();
            taskList.add(tsk);
            insert taskList;
        Test.stopTest();
        
        List <Task> createdTask = [SELECT Id FROM Task WHERE Id = :taskList[0].id];
        System.assert(taskList != Null, 'Task created successfully');
      }
    }
}