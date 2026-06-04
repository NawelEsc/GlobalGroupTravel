public class TripTriggerHandler {
    public static void handleBefore(List<Trip__c> newTrips) {
     
    for (Trip__c trip : newTrips) {
        if (trip.Start_Date__c != null && trip.End_Date__c != null) {
            if (trip.Start_Date__c > trip.End_Date__c) {
                trip.addError('La date de début doit être antérieure à la date de fin.');
            }
        }

    }
}
}