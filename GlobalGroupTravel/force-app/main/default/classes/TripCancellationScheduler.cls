public class TripCancellationScheduler implements Schedulable {
public void execute (SchedulableContext sc) {
    TripCancellationBatch batch = new TripCancellationBatch();
    Database.executeBatch (batch) ;
}
}
