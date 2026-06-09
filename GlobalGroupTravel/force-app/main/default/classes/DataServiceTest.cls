@isTest
public class DataServiceTest {

    @isTest
    static void testInsertRecords() {
        Account acc = new Account(Name = 'Test Account');
        DataService.insertRecords(new List<SObject>{acc});
        List<Account> accounts = [SELECT Id FROM Account WHERE Name = 'Test Account'];
        System.assertEquals(1, accounts.size(), 'Le compte doit être inséré');
    }

    @isTest
    static void testUpdateRecords() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        acc.Name = 'Updated Account';
        DataService.updateRecords(new List<SObject>{acc});
        Account updatedAcc = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Updated Account', updatedAcc.Name, 'Le nom doit être mis à jour');
    }

    @isTest
    static void testDeleteRecords() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        DataService.deleteRecords(new List<SObject>{acc});
        List<Account> accounts = [SELECT Id FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, accounts.size(), 'Le compte doit être supprimé');
    }
}