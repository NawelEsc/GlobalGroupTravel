@isTest
public class ContractManagerTest {

    @isTest
    static void testCreateContract() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        ContractManager.createContract(acc.Id, Date.today(), 12);
        List<Contract> contracts = [SELECT Id FROM Contract WHERE AccountId = :acc.Id];
        System.assertEquals(1, contracts.size(), 'Le contrat doit être créé');
    }

    @isTest
    static void testGetContracts() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Contract con = new Contract(AccountId = acc.Id, StartDate = Date.today(), ContractTerm = 12);
        insert con;
        List<Contract> contracts = ContractManager.getContracts();
        System.assert(contracts.size() > 0, 'La liste ne doit pas être vide');
    }

    @isTest
    static void testUpdateContract() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Contract con = new Contract(AccountId = acc.Id, StartDate = Date.today(), ContractTerm = 12);
        insert con;
        ContractManager.updateContract(con.Id, 'Activated');
        Contract updatedCon = [SELECT Status FROM Contract WHERE Id = :con.Id];
        System.assertEquals('Activated', updatedCon.Status, 'Le statut doit être mis à jour');
    }

    @isTest
    static void testDeleteContract() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Contract con = new Contract(AccountId = acc.Id, StartDate = Date.today(), ContractTerm = 12);
        insert con;
        ContractManager.deleteContract(con.Id);
        List<Contract> contracts = [SELECT Id FROM Contract WHERE Id = :con.Id];
        System.assertEquals(0, contracts.size(), 'Le contrat doit être supprimé');
    }
}