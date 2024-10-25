package application.Controllers;


import application.Repositories.ExcelDataRepository;

import java.util.List;
import java.util.Map;

/**
 * The type Excel data controller.
 */
public class ExcelDataController {
    /**
     * Gets map with insert scripts.
     *
     * @return the map with insert scripts
     */
    public static Map<String, List<String>> getMapWithInsertScripts() {
        return ExcelDataRepository.getInstance().getData();
    }

    /**
     * Store data.
     *
     * @param data the data
     */
    public static void storeData(Map<String, List<String>> data) {
        ExcelDataRepository.getInstance().storeData(data);
    }
}
