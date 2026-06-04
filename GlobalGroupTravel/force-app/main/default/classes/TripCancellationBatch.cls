public class TripCancellationBatch implements Database.Batchable<SObject> {

    public DataBase.QueryLocator start (DataBase.BatchableContext BC) {
    Date sevenDaysFromNow = Date.today().addDays(7);
    return Database.getQueryLocator([SELECT Id, Status__c, Number_of_Participants__c, Start_Date__c FROM Trip__c WHERE Start_Date__c <= :sevenDaysFromNow AND Number_of_Participants__c <10 AND Status__c != 'Annulé']);
    }

    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        List<Trip__c> tripsToUpdate = new List<Trip__c>();
        for (SObject s : scope) {
            Trip__c trip = (Trip__c) s;
            trip.Status__c = 'Annulé';
            tripsToUpdate.add(trip);
        }
        if (!tripsToUpdate.isEmpty()) {
            update tripsToUpdate;
        }
    }

    public void finish(Database.BatchableContext BC) {
    }
}
