public class TripStatusScheduler implements Schedulable {
public void execute (SchedulableContext sc) {
    TripStatusUpdateBatch batch = new TripStatusUpdateBatch();
    Database.executeBatch (batch) ;
}
}
