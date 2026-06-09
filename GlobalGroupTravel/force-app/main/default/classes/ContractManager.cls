public class ContractManager {

    public static List<Contract> getContracts() {
        return [SELECT Id, AccountId, StartDate, ContractTerm, Status FROM Contract];
    }

    public static void createContract(Id accountId, Date startDate, Integer contractTerm) {
        Contract con = new Contract(
            AccountId = accountId,
            StartDate = startDate,
            ContractTerm = contractTerm
        );
        DataService.insertRecords(new List<SObject>{con});
    }

    public static void updateContract(Id contractId, String newStatus) {
        Contract con = new Contract(Id = contractId, Status = newStatus);
        DataService.updateRecords(new List<SObject>{con});
    }

    public static void deleteContract(Id contractId) {
        Contract con = new Contract(Id = contractId);
        DataService.deleteRecords(new List<SObject>{con});
    }
}