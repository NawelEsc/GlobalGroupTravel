public class AccountManager {

    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Phone FROM Account WITH SECURITY_ENFORCED];
    }

    public static void createAccount(String name, String phone) {
        Account acc = new Account(Name = name, Phone = phone);
        DataService.insertRecords(new List<SObject>{acc});
    }

    public static void updateAccount(Id accId, String newName) {
        Account acc = new Account(Id = accId, Name = newName);
        DataService.updateRecords(new List<SObject>{acc});
    }

    public static void deleteAccount(Id accId) {
        Account acc = new Account(Id = accId);
        DataService.deleteRecords(new List<SObject>{acc});
    }
}
