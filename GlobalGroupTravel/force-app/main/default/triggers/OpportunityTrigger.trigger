trigger OpportunityTrigger on Opportunity (before insert, before update, after update) {
    
    if (Trigger.isBefore) {
        for (Opportunity opp : Trigger.new) {
            if (opp.Amount != null && opp.Amount < 0) {
                opp.Amount.addError('Le montant ne peut pas être négatif');
            }
        }
    }
    
    if (Trigger.isAfter) {
        OpportunityTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }
}