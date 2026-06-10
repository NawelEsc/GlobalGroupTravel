public class AccountManager {

    public static List<Account> getAccounts() {
        System.debug('Récupération de tous les comptes');
        return [SELECT Id, Name, Phone FROM Account WITH SECURITY_ENFORCED];
    }

    public static void createAccount(String name, String phone) {
        System.debug('Création d un compte : ' + name);
        Account acc = new Account(Name = name, Phone = phone);
        DataService.insertRecords(new List<SObject>{acc});
    }

    public static void updateAccount(Id accId, String newName) {
        System.debug('Mise à jour du compte : ' + accId);
        Account acc = new Account(Id = accId, Name = newName);
        DataService.updateRecords(new List<SObject>{acc});
    }

    public static void deleteAccount(Id accId) {
        System.debug('Suppression du compte : ' + accId);
        Account acc = new Account(Id = accId);
        DataService.deleteRecords(new List<SObject>{acc});
    }
}