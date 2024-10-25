package application.ui.menu.data_base;

import application.Controllers.ExcelDataController;
import application.domain.data_base.SQLFileWriter;

import java.util.List;
import java.util.Map;

/**
 * The type Sql file writer ui.
 */
public class SQLFileWriterUI implements Runnable {
    public void run() {
        Map<String, List<String>> excelData = ExcelDataController.getMapWithInsertScripts();

        if (excelData.isEmpty()) {
            System.out.println("There is no data to write in the SQL file.");
        } else {
            String sqlFileName = "src/main/resources/insert.sql";

            SQLFileWriter.writeSqlFile(sqlFileName, excelData);
            System.out.println("Data printed in the file with success: " + sqlFileName);
        }
    }
}
