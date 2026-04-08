@IsTest
private class GNE_AccountUpdateBatchTest {
    @IsTest
    static void testBatchSuccess() {
        Account acct = new Account(Name = 'Test');
        insert acct;

        Test.startTest();
        Database.executeBatch(new GNE_AccountUpdateBatch());
        Test.stopTest();

        System.assertEquals(1, [SELECT COUNT() FROM Account WHERE Id = :acct.Id AND Type = 'Other']);
    }
}