@isTest
public class OpportunityTriggerHandlerTest {

    @isTest
    static void testCreateTripWhenOpportunityClosedWon() {
        // ... code existant ...
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