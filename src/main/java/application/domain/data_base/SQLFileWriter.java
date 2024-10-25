package application.domain.data_base;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * The type Sql file writer.
 */
public class SQLFileWriter {

    /**
     * Write sql file.
     *
     * @param fileName the file name
     * @param data     the data
     */
    public static void writeSqlFile(String fileName, Map<String, List<String>> data) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, false))) {
            for (SheetOrder sheetOrder : SheetOrder.values()) {
                String sheetName = sheetOrder.getSheetName();
                List<String> sheetData = data.get(sheetName);

                if (sheetData == null) {
                    continue;
                }

                writer.write("-- SQL Commands for sheet: " + sheetName + "\n");
                for (String sql : sheetData) {
                    writer.write(sql);
                    writer.write("\n");
                }
                writer.write("\n");
            }
        } catch (IOException e) {
            throw new RuntimeException("Error writing to SQL file: " + e.getMessage());
        }
    }

    /**
     * The enum Sheet order.
     */
    public enum SheetOrder {
        /**
         * Clients sheet order.
         */
        CLIENTS("Clients"),
        /**
         * ProductFamily sheet order.
         */
        PRODUCT_FAMILY("ProductFamily"),
        /**
         * Products sheet order.
         */
        PRODUCTS("Products"),
        /**
         * Orders sheet order.
         */
        ORDERS("Orders"),
        /**
         * WorkstationTypes sheet order.
         */
        WORKSTATION_TYPES("WorkstationTypes"),
        /**
         * Operations sheet order.
         */
        OPERATIONS("Operations"),
        /**
         * Workstations sheet order.
         */
        WORKSTATIONS("Workstations"),
        /**
         * BOM (Bill Of Materials) sheet order.
         */
        BOM("BOM"),
        /**
         * BOO (Bill Of Operations) sheet order.
         */
        BOO("BOO");

        private final String sheetName;

        SheetOrder(String sheetName) {
            this.sheetName = sheetName;
        }

        /**
         * Gets sheet name.
         *
         * @return the sheet name
         */
        public String getSheetName() {
            return sheetName;
        }
    }

}
