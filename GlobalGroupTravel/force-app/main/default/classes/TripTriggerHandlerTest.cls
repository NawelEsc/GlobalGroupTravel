@isTest
public class TripTriggerHandlerTest {

    @isTest
    static void testEndDateBeforeStartDate() {Trip__c trip = new Trip__c(
            Name = 'Test Trip',
            Start_Date__c = Date.today().addDays(10),
            End_Date__c = Date.today().addDays(5),
            Opportunity__c = null 
);
        
        try {
            insert trip;
            System.assert(false, 'Une erreur aurait dû être déclenchée');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('La date de début doit être antérieure à la date de fin'));
        }
    }
}
