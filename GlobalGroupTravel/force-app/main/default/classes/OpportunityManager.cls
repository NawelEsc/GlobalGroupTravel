public class OpportunityManager {

    public static List<Opportunity> getOpportunities() {
        System.debug('Récupération de toutes les opportunités');
        return [SELECT Id, Name, StageName, CloseDate, Amount, AccountId, 
                Destination__c, Start_Date__c, End_Date__c, 
                Number_of_Participants__c FROM Opportunity WITH SECURITY_ENFORCED];
    }

    public static void createOpportunity(String name, String stageName, Date closeDate, Id accountId) {
        System.debug('Création d une opportunité : ' + name);
        Opportunity opp = new Opportunity(
            Name = name,
            StageName = stageName,
            CloseDate = closeDate,
            AccountId = accountId
        );
        DataService.insertRecords(new List<SObject>{opp});
    }

    public static void updateOpportunity(Id oppId, String newStageName) {
        System.debug('Mise à jour de l opportunité : ' + oppId);
        Opportunity opp = new Opportunity(Id = oppId, StageName = newStageName);
        DataService.updateRecords(new List<SObject>{opp});
    }

    public static void deleteOpportunity(Id oppId) {
        System.debug('Suppression de l opportunité : ' + oppId);
        Opportunity opp = new Opportunity(Id = oppId);
        DataService.deleteRecords(new List<SObject>{opp});
    }
}