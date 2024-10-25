package application.ui.menu.data_base;

import application.Controllers.ExcelDataController;
import application.domain.data_base.ExcelReader;

import java.util.List;
import java.util.Map;

/**
 * The type Excel reader ui.
 */
public class ExcelReaderUI implements Runnable {

    public void run() {
        String filePath = "src/main/resources/data.xlsx";
        Map<String, List<String>> excelData = ExcelReader.readExcel(filePath);

        ExcelDataController.storeData(excelData);
    }
}

