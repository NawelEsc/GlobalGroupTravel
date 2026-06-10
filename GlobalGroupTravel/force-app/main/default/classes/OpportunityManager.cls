public class OpportunityManager {

    public static List<Opportunity> getOpportunities() {
        return [SELECT Id, Name, StageName, CloseDate, Amount, AccountId, 
        Destination__c, Start_Date__c, End_Date__c, 
        Number_of_Participants__c FROM Opportunity WITH SECURITY_ENFORCED];
    }

    public static void createOpportunity(String name, String stageName, Date closeDate, Id accountId) {
        Opportunity opp = new Opportunity(
            Name = name,
            StageName = stageName,
            CloseDate = closeDate,
            AccountId = accountId
        );
        DataService.insertRecords(new List<SObject>{opp});
    }

    public static void updateOpportunity(Id oppId, String newStageName) {
        Opportunity opp = new Opportunity(Id = oppId, StageName = newStageName);
        DataService.updateRecords(new List<SObject>{opp});
    }

    public static void deleteOpportunity(Id oppId) {
        Opportunity opp = new Opportunity(Id = oppId);
        DataService.deleteRecords(new List<SObject>{opp});
    }
}