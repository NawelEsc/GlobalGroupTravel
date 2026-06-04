@isTest
public class TripStatusUpdateBatchTest {

    @isTest
    static void testStatusUpdate() {
        Trip__c trip = new Trip__c(
            Name = 'Test Trip',
            Start_Date__c = Date.today().addDays(-1 ),
            End_Date__c = Date.today().addDays(5),
            Status__c =  'En cours'                                  
        );
        insert trip;

          test.startTest();
        TripStatusUpdateBatch batch = new TripStatusUpdateBatch();                      
        Database.executeBatch(batch);
        test.stopTest();        

        Trip__c updatedTrip = [SELECT Status__c FROM Trip__c WHERE Id = :trip.Id];
        System.assertEquals('En cours', updatedTrip.Status__c, 'Le statut du voyage devrait être mis à jour en "En cours"');
    }
}