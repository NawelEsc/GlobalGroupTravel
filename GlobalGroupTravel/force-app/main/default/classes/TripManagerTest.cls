@isTest
public class TripManagerTest {

    @isTest
    static void testCreateTrip() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        TripManager.createTrip('Paris', Date.today().addDays(10), Date.today().addDays(15), 15, acc.Id, null);
        List<Trip__c> trips = [SELECT Id FROM Trip__c WHERE Destination__c = 'Paris'];
        System.assertEquals(1, trips.size(), 'Le trip doit être créé');
    }

    @isTest
    static void testGetTrips() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Trip__c trip = new Trip__c(
            Destination__c = 'Paris',
            Start_Date__c = Date.today().addDays(10),
            End_Date__c = Date.today().addDays(15),
            Status__c = 'A venir',
            Account__c = acc.Id
        );
        insert trip;
        List<Trip__c> trips = TripManager.getTrips();
        System.assert(trips.size() > 0, 'La liste ne doit pas être vide');
    }

    @isTest
    static void testUpdateTrip() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Trip__c trip = new Trip__c(
            Destination__c = 'Paris',
            Start_Date__c = Date.today().addDays(10),
            End_Date__c = Date.today().addDays(15),
            Status__c = 'A venir',
            Account__c = acc.Id
        );
        insert trip;
        TripManager.updateTrip(trip.Id, 'En cours');
        Trip__c updatedTrip = [SELECT Status__c FROM Trip__c WHERE Id = :trip.Id];
        System.assertEquals('En cours', updatedTrip.Status__c, 'Le statut doit être mis à jour');
    }

    @isTest
    static void testDeleteTrip() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Trip__c trip = new Trip__c(
            Destination__c = 'Paris',
            Start_Date__c = Date.today().addDays(10),
            End_Date__c = Date.today().addDays(15),
            Status__c = 'A venir',
            Account__c = acc.Id
        );
        insert trip;
        TripManager.deleteTrip(trip.Id);
        List<Trip__c> trips = [SELECT Id FROM Trip__c WHERE Id = :trip.Id];
        System.assertEquals(0, trips.size(), 'Le trip doit être supprimé');
    }
}