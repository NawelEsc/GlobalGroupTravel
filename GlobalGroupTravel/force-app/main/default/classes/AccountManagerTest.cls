@isTest
public class AccountManagerTest {

    @isTest
    static void testCreateAccount() {
        AccountManager.createAccount('Test Account', '0123456789');
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name = 'Test Account'];
        System.assertEquals(1, accounts.size(), 'Le compte doit être créé');
    }

    @isTest
    static void testGetAccounts() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        List<Account> accounts = AccountManager.getAccounts();
        System.assert(accounts.size() > 0, 'La liste ne doit pas être vide');
    }

    @isTest
    static void testUpdateAccount() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        AccountManager.updateAccount(acc.Id, 'Updated Account');
        Account updatedAcc = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Updated Account', updatedAcc.Name, 'Le nom doit être mis à jour');
    }

    @isTest
    static void testDeleteAccount() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        AccountManager.deleteAccount(acc.Id);
        List<Account> accounts = [SELECT Id FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, accounts.size(), 'Le compte doit être supprimé');
    }
}