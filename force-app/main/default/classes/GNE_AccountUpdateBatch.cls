public with sharing class GNE_AccountUpdateBatch implements Database.Batchable<sObject> {
    // 1. Start: Collect records to process
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name, Type FROM Account WHERE Type = null');
    }

    // 2. Execute: Process each chunk of records (default size 200)
    public void execute(Database.BatchableContext BC, List<Account> scope) {
        for (Account acc : scope) {
            acc.Type = 'Other';
        }
        update scope;
    }

    // 3. Finish: Post-processing (e.g., send notification email)
    public void finish(Database.BatchableContext BC) {
        System.debug('Batch processing completed successfully.');
    }    
}