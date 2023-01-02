public class LeadHandler {
    public static void createTask(List <Lead> newList){
        List <Task> taskList = new List <Task>();
        User user = [SELECT ID,Name FROM User WHERE Name = 'Cardo Dalisay'];
        for(Lead l: newList){
            if(l.Status == 'Open - Not Contacted'){
                Task tsk = new Task();
                tsk.Subject = 'Follow up the lead';
                tsk.WhoId = l.Id;
                tsk.Status = 'Not Started';
                tsk.ActivityDate = date.today();
                tsk.OwnerId = user.Id;
                taskList.add(tsk);
            }
        }
        insert taskList;
         System.debug('Task was created succesfully');
    }
}