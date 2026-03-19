@isTest
private class AccountDomainTest {
    
    @isTest
    static void testUpdateAccountDescription() {
        // Create test Account
        Account acc = new Account(Name = 'Demo Account');
        insert acc;
        
        // Call method
        Test.startTest();
        AccountDomain.updateAccountDescription(acc.Id, 'Updated Description');
        Test.stopTest();
        
        // Verify
        Account updatedAcc = [SELECT Description FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Updated Description', updatedAcc.Description, 'Description should be updated');
    }
    
    @isTest
    static void testGetAccountName() {
        // Create test Account
        Account acc = new Account(Name = 'Demo Account 2');
        insert acc;
        
        // Call method
        String accName = AccountDomain.getAccountName(acc.Id);
        
        // Verify
        System.assertEquals('Demo Account 2', accName, 'Account name should match');
    }
    
    @isTest
    static void testInvalidInputs() {
        // Negative test case
        Boolean exceptionThrown = false;
        try {
            AccountDomain.updateAccountDescription(null, '');
        } catch (Exception e) {
            exceptionThrown = true;
        }
        System.assertEquals(true, exceptionThrown, 'Exception should be thrown for invalid inputs');
    }
}