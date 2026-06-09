@isTest
public class OpportunityManagerTest {

    @isTest
    static void testCreateOpportunity() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        OpportunityManager.createOpportunity('Test Opp', 'Prospecting', Date.today().addDays(30), acc.Id);
        List<Opportunity> opps = [SELECT Id, Name FROM Opportunity WHERE Name = 'Test Opp'];
        System.assertEquals(1, opps.size(), 'L opportunité doit être créée');
    }

    @isTest
    static void testGetOpportunities() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Opportunity opp = new Opportunity(Name = 'Test Opp', StageName = 'Prospecting', CloseDate = Date.today().addDays(30), AccountId = acc.Id);
        insert opp;
        List<Opportunity> opps = OpportunityManager.getOpportunities();
        System.assert(opps.size() > 0, 'La liste ne doit pas être vide');
    }

    @isTest
    static void testUpdateOpportunity() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Opportunity opp = new Opportunity(Name = 'Test Opp', StageName = 'Prospecting', CloseDate = Date.today().addDays(30), AccountId = acc.Id);
        insert opp;
        OpportunityManager.updateOpportunity(opp.Id, 'Qualification');
        Opportunity updatedOpp = [SELECT StageName FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals('Qualification', updatedOpp.StageName, 'Le stage doit être mis à jour');
    }

    @isTest
    static void testDeleteOpportunity() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Opportunity opp = new Opportunity(Name = 'Test Opp', StageName = 'Prospecting', CloseDate = Date.today().addDays(30), AccountId = acc.Id);
        insert opp;
        OpportunityManager.deleteOpportunity(opp.Id);
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(0, opps.size(), 'L opportunité doit être supprimée');
    }
}