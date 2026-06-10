public class ContractManager {

    public static List<Contract> getContracts() {
        System.debug('Récupération de tous les contrats');
        return [SELECT Id, AccountId, StartDate, ContractTerm, Status FROM Contract WITH SECURITY_ENFORCED];
    }

    public static void createContract(Id accountId, Date startDate, Integer contractTerm) {
        System.debug('Création d un contrat pour le compte : ' + accountId);
        Contract con = new Contract(
            AccountId = accountId,
            StartDate = startDate,
            ContractTerm = contractTerm
        );
        DataService.insertRecords(new List<SObject>{con});
    }

    public static void updateContract(Id contractId, String newStatus) {
        System.debug('Mise à jour du contrat : ' + contractId);
        Contract con = new Contract(Id = contractId, Status = newStatus);
        DataService.updateRecords(new List<SObject>{con});
    }

    public static void deleteContract(Id contractId) {
        System.debug('Suppression du contrat : ' + contractId);
        Contract con = new Contract(Id = contractId);
        DataService.deleteRecords(new List<SObject>{con});
    }
}