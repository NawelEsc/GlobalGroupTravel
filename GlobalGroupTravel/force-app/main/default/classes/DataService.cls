public class DataService {

    public static void insertRecords(List<SObject> records) {
        if (!records.isEmpty()) {
            insert records;
        }
    }

    public static void updateRecords(List<SObject> records) {
        if (!records.isEmpty()) {
            update records;
        }
    }

    public static void deleteRecords(List<SObject> records) {
        if (!records.isEmpty()) {
            delete records;
        }
    }
}