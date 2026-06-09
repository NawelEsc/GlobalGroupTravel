public class TripManager {

    public static List<Trip__c> getTrips() {
        return [SELECT Id, Name, Status__c, Destination__c, Start_Date__c, 
                End_Date__c, Number_of_Participants__c, Total_Cost__c, 
                Account__c, Opportunity__c FROM Trip__c];
    }

    public static void createTrip(String destination, Date startDate, Date endDate, Integer numberOfParticipants, Id accountId, Id opportunityId) {
        Trip__c trip = new Trip__c(
            Destination__c = destination,
            Start_Date__c = startDate,
            End_Date__c = endDate,
            Number_of_Participants__c = numberOfParticipants,
            Status__c = 'A venir',
            Account__c = accountId,
            Opportunity__c = opportunityId
        );
        DataService.insertRecords(new List<SObject>{trip});
    }

    public static void updateTrip(Id tripId, String newStatus) {
        Trip__c trip = new Trip__c(Id = tripId, Status__c = newStatus);
        DataService.updateRecords(new List<SObject>{trip});
    }

    public static void deleteTrip(Id tripId) {
        Trip__c trip = new Trip__c(Id = tripId);
        DataService.deleteRecords(new List<SObject>{trip});
    }
}