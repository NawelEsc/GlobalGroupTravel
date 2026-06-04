public class TripStatusUpdateBatch implements Database.Batchable<SObject> {

    public DataBase.QueryLocator start (DataBase.BatchableContext BC) {
    return Database.getQueryLocator([SELECT Id, Status__c, Start_Date__c, End_Date__c FROM Trip__c WHERE Status__c != 'Annulé']);
    }                                                           

    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        List<Trip__c> tripsToUpdate = new List<Trip__c>();
        Date today = Date.today();

        for (SObject s : scope) {
            Trip__c trip = (Trip__c) s;

            if (today < trip.Start_Date__c) {
                trip.Status__c = 'A venir';
            } else if (today >= trip.Start_Date__c && today <= trip.End_Date__c) {
                trip.Status__c = 'En cours';
            } else if (today > trip.End_Date__c) {
                trip.Status__c = 'Terminé';
            }
            tripsToUpdate.add(trip);
        }
        if (!tripsToUpdate.isEmpty()) {
            update tripsToUpdate;
        }
    }
    public void finish(Database.BatchableContext BC) {
    }
}