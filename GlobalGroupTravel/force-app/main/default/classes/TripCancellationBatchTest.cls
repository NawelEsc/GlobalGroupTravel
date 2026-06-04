@isTest
public class TripCancellationBatchTest {

    @isTest
    static void testTripCancellation() {
        Trip__c trip = new Trip__c(
            Name = 'Test Trip',
            Number_of_participants__c = 5,
            Start_Date__c = Date.today().addDays(7),
            End_Date__c = Date.today().addDays(15),
            Status__c =  'A venir'                                  
        );
        insert trip;        

        test.startTest();
        TripCancellationBatch batch = new TripCancellationBatch();
        Database.executeBatch(batch);
        test.stopTest();

        Trip__c updatedTrip = [SELECT Status__c FROM Trip__c WHERE Id = :trip.Id];
        System.assertEquals('Annulé', updatedTrip.Status__c, 'Le statut du voyage devrait être mis à jour en "Annulé"');
    }
}
