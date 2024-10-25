package application.ui.menu;

import application.ui.menu.data_base.ExcelReaderUI;
import application.ui.menu.data_base.SQLFileWriterUI;

/**
 * The type Main.
 */
public class Main {
    /**
     * The entry point of application.
     *
     * @param args the input arguments
     */
    public static void main(String[] args) {
        ExcelReaderUI excelReaderUI = new ExcelReaderUI();
        excelReaderUI.run();
        SQLFileWriterUI sqlFileWriterUI = new SQLFileWriterUI();
        sqlFileWriterUI.run();
    }
}