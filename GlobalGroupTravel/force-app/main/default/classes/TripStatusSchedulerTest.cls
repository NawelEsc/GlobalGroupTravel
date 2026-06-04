@isTest
public class TripStatusSchedulerTest {

    @isTest
    static void testScheduler() {
        Test.startTest();
        TripStatusScheduler scheduler = new TripStatusScheduler();
        String cronExp = '0 0 0 * * ?';
        System.schedule('Test TripStatusScheduler', cronExp, scheduler);
        Test.stopTest();
    }
}