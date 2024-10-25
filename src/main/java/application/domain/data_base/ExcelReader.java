package application.domain.data_base;

import org.apache.poi.ss.usermodel.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

/**
 * The type Excel reader.
 */
public class ExcelReader {
    /**
     * Read excel map.
     *
     * @param filePath the file path
     * @return the map
     */
    public static Map<String, List<String>> readExcel(String filePath) {
        Map<String, List<String>> sheetDataMap;
        try {
            FileInputStream fileStream = new FileInputStream(filePath);
            Workbook workbook = WorkbookFactory.create(fileStream);
            FormulaEvaluator formulaEvaluator = workbook.getCreationHelper().createFormulaEvaluator();
            sheetDataMap = processWorkbook(workbook, formulaEvaluator);

            workbook.close();
            fileStream.close();
        } catch (IOException e) {
            throw new RuntimeException("Error reading Excel file: " + e.getMessage());
        }
        return sheetDataMap;
    }

    private static Map<String, List<String>> processWorkbook(Workbook workbook, FormulaEvaluator formulaEvaluator) {
        Map<String, List<String>> sheetDataMap = new HashMap<>();

        for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
            Sheet sheet = workbook.getSheetAt(sheetIndex);
            processSheet(sheetDataMap, sheet, formulaEvaluator);
        }

        return sheetDataMap;
    }

    private static void processSheet(Map<String, List<String>> sheetDataMap, Sheet sheet, FormulaEvaluator formulaEvaluator) {
        String sheetName = sheet.getSheetName();
        List<Integer> columnIndexes = findColumnIndexes(sheet);

        if (columnIndexes.isEmpty()) {
            System.out.println("-- No relevant SQL columns found for table: " + sheetName);
            return;
        }

        List<String> combinedColumnData = new ArrayList<>();
        for (int columnIndex : columnIndexes) {
            combinedColumnData.addAll(readColumnData(sheet, columnIndex, formulaEvaluator));
        }

        if (!combinedColumnData.isEmpty()) {
            sheetDataMap.put(sheetName, combinedColumnData);
            System.out.println("-- SQL Commands for sheet: " + sheetName);
        }
    }

    private static List<Integer> findColumnIndexes(Sheet sheet) {
        List<Integer> columnIndexes = new ArrayList<>();
        Row firstRow = sheet.getRow(0);

        if (firstRow == null) {
            return columnIndexes;
        }

        for (Cell cell : firstRow) {
            Integer columnIndex = getColumnIndexIfMatches(cell);
            if (columnIndex != null) {
                columnIndexes.add(columnIndex);
            }
        }
        return columnIndexes;
    }

    private static Integer getColumnIndexIfMatches(Cell cell) {
        if (cell.getCellType() != CellType.STRING) {
            return null;
        }

        String cellValue = cell.getStringCellValue();
        for (CollumnsToRead column : CollumnsToRead.values()) {
            if (column.collumnToRead.equals(cellValue)) {
                return cell.getColumnIndex();
            }
        }
        return null;
    }


    private static List<String> readColumnData(Sheet sheet, int columnIndex, FormulaEvaluator formulaEvaluator) {
        List<String> columnValues = new ArrayList<>();
        for (Row row : sheet) {
            if (row.getRowNum() == 0) continue; // Skip header row

            Cell cell = row.getCell(columnIndex, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
            if (isCellEmpty(cell)) {
                continue; // Skip empty cells
            }

            columnValues.add(processCellData(cell, formulaEvaluator));
        }
        return columnValues;
    }

    private static boolean isCellEmpty(Cell cell) {
        if (cell == null || cell.getCellType() == CellType.BLANK) {
            return true;
        }
        return cell.getCellType() == CellType.STRING && cell.getStringCellValue().trim().isEmpty();
    }

    private static String processCellData(Cell cell, FormulaEvaluator formulaEvaluator) {
        String cellValue = getCellValueAsString(cell, formulaEvaluator);

        String[] sqlCommands = cellValue.split(";");
        StringBuilder formattedCommands = new StringBuilder();

        for (String sqlCommand : sqlCommands) {
            sqlCommand = sqlCommand.trim();
            if (sqlCommand.isEmpty()) {
                continue; // Ignores empty commands
            }

            int valuesIndex = sqlCommand.toLowerCase().indexOf("values (");

            if (valuesIndex != -1) {
                String beforeValues = sqlCommand.substring(0, valuesIndex + "values (".length());
                String afterValues = sqlCommand.substring(valuesIndex + "values (".length());

                formattedCommands.append(beforeValues).append(formatSqlValues(afterValues));
            } else {
                formattedCommands.append(sqlCommand);
            }
            if (sqlCommands.length > 1) {
                formattedCommands.append("\n");
            }
        }

        return formattedCommands.toString();
    }

    private static String formatSqlValues(String sqlValues) {
        String[] parts = sqlValues.split(",");
        StringBuilder formattedValues = new StringBuilder();
        for (String part : parts) {
            formattedValues.append(formatSqlValuePart(part));
            formattedValues.append(",");
        }

        if (!formattedValues.isEmpty()) {
            formattedValues.setLength(formattedValues.length() - 1);
        }
        formattedValues.append(";");

        return formattedValues.toString();
    }

    private static String formatSqlValuePart(String part) {
        String trimmedPart = part.trim();

        if (trimmedPart.endsWith(");")) {
            trimmedPart = trimmedPart.substring(0, trimmedPart.length() - 2).trim();
        }

        return trimmedPart;
    }

    private static String getCellValueAsString(Cell cell, FormulaEvaluator formulaEvaluator) {
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue().trim();
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                // Avalia a fórmula e retorna o valor calculado
                return getFormulaResultAsString(cell, formulaEvaluator);
            case BLANK:
                return ""; // Célula em branco
            default:
                return "";
        }
    }

    private static String getFormulaResultAsString(Cell cell, FormulaEvaluator formulaEvaluator) {
        CellValue cellValue = formulaEvaluator.evaluate(cell);

        return switch (cellValue.getCellType()) {
            case STRING -> cellValue.getStringValue().trim();
            case NUMERIC -> String.valueOf(cellValue.getNumberValue());
            case BOOLEAN -> String.valueOf(cellValue.getBooleanValue());
            default -> "";
        };
    }


    /**
     * The enum Collumns to read.
     */
    public enum CollumnsToRead {
        /**
         * Location collumns to read.
         */
        LOCATION("Location"),
        /**
         * Customer collumns to read.
         */
        CUSTOMER("Customer"),
        /**
         * ProductFamily collumns to read.
         */
        PRODUCT_FAMILY("ProductFamily"),
        /**
         * Order collumns to read.
         */
        ORDER("Order"),
        /**
         * Delivery collumns to read.
         */
        DELIVERY("Delivery"),
        /**
         * Production order collumns to read.
         */
        PRODUCTION_ORDER("ProductionOrder"),
        /**
         * Operation collumns to read.
         */
        OPERATION("Operation"),
        /**
         * Operation workstation type collumns to read.
         */
        OPERATION_WORKSTATION_TYPE("Operation_WorkstationType"),
        /**
         * Sql collumns to read.
         */
        SQL("SQL"),
        /**
         * Workstation collumns to read.
         */
        WORKSTATION("Workstation"),
        /**
         * Part collumns to read.
         */
        PART("Part"),
        /**
         * BillOfMaterials collumns to read.
         */
        BILL_OF_MATERIALS("BillOfMaterials"),
        /**
         * BillOfOperations collumns to read.
         */
        BILL_OF_OPERATIONS("BillOfOperations");

        private final String collumnToRead;

        CollumnsToRead(String collumnToRead) {
            this.collumnToRead = collumnToRead;
        }
    }

}
