@isTest
public class OpportunityTriggerHandlerTest {

    @isTest
    static void testCreateTripWhenOpportunityClosedWon() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30),
            AccountId = acc.Id
        );
        insert opp;

        opp.StageName = 'Closed Won';
        update opp;

        List<Trip__c> trips = [SELECT Id FROM Trip__c WHERE Opportunity__c = :opp.Id];
        System.assertEquals(1, trips.size(), 'Un Trip doit être créé');
    }

    @isTest
    static void testNegativeAmount() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        try {
            Opportunity opp = new Opportunity(
                Name = 'Test Opp',
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(30),
                AccountId = acc.Id,
                Amount = -100
            );
            insert opp;
            System.assert(false, 'Une erreur aurait dû être déclenchée');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Le montant ne peut pas être négatif'));
        }
    }
}