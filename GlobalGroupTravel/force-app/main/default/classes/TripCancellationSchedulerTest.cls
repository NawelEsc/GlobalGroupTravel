@isTest
public class TripCancellationSchedulerTest {

    @isTest
    static void testScheduler() {
        Test.startTest();
        TripCancellationScheduler scheduler = new TripCancellationScheduler();
        String cronExp = '0 0 0 * * ?';
        System.schedule('Test TripCancellationScheduler', cronExp, scheduler);
        Test.stopTest();
    }
}