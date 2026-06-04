public class OpportunityTriggerHandler {

    //Règle métier GGT - 02 : Lorsqu'une opportunité est mise à jour et que son stage devient "Closed Won", créer automatiquement un Trip__c
public static void handleAfterUpdate(List<Opportunity> newOpps, Map<Id, Opportunity> oldMap) {
    List<Trip__c> tripsToCreate = new List<Trip__c>();
            for (Opportunity opp : newOpps) {  
            if (opp.StageName == 'Closed Won' && oldMap.get(opp.Id).StageName != 'Closed Won') {
               
                 Trip__c trip = new Trip__c(
                    Status__c = 'A venir',
                     Destination__c = opp.Destination__c,
                     Start_Date__c = opp.Start_Date__c,
                     End_Date__c = opp.End_Date__c,
                     Number_of_Participants__c = opp.Number_of_Participants__c,
                     Total_Cost__c = opp.Amount,
                     Account__c = opp.AccountId,
                     Opportunity__c = opp.Id
                );
                tripsToCreate.add(trip);
        }
    }           

if (!tripsToCreate.isEmpty()) {
    insert tripsToCreate;

        }
    }
}
    