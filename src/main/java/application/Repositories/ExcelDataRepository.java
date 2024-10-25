package application.Repositories;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * The type Excel data repository.
 */
public class ExcelDataRepository {
    private static final ExcelDataRepository INSTANCE = new ExcelDataRepository();

    private final Map<String, List<String>> excelData;

    private ExcelDataRepository() {
        excelData = new ConcurrentHashMap<>();
    }

    /**
     * Gets instance.
     *
     * @return the instance
     */
    public static ExcelDataRepository getInstance() {
        return INSTANCE;
    }

    /**
     * Store data.
     *
     * @param data the data
     */
    public void storeData(Map<String, List<String>> data) {
        excelData.clear();
        excelData.putAll(data);
    }

    /**
     * Gets data.
     *
     * @return the data
     */
    public Map<String, List<String>> getData() {
        return excelData;
    }
}

