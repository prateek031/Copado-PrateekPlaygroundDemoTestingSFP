public with sharing class AccountDomain {
    
    // Method to update Account description
    public static void updateAccountDescription(Id accountId, String newDescription) {
        if (accountId == null || String.isBlank(newDescription)) {
            throw new AuraHandledException('Invalid input provided');
        }

        Account acc = [SELECT Id, Description FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Description = newDescription;
        update acc;
    }
    
    // Method to fetch Account Name
    public static String getAccountName(Id accountId) {
        if (accountId == null) {
            return null;
        }
        Account acc = [SELECT Name FROM Account WHERE Id = :accountId LIMIT 1];
        return acc.Name;
    }
}