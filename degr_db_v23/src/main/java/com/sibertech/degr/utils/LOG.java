package com.sibertech.degr.utils;

import com.sibertech.degr.db.ConfJDBC;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LOG {
    
    protected Logger logback = LoggerFactory.getLogger(LOG.class);
    
    protected String sLogDir = null; // путь к файлу, с завершающим слешем
    protected String sLogFileName = null; // имя файла с расширением
    
    protected Path pLogDir = null;
    protected Path pLogFilePath = null;
    
    String sDbName = null;
    String sTableName = null;
    
    /**
     * 
     * @param sLogDir   - путь к файлу, без завершающго слеша ("d:\path\dir", "..\..\some\path" ...)
     * @param sDbName    - имя базы данных ("a_01_mln", "shard_01_mln_tomsk" ...)
     * @param sTableName - куда пишем ("sales" или "sales_parted")
     * @throws IOException 
     */
    public LOG (String sLogDir, String sDbName, String sTableName) throws IOException {
        
        String sLogFileName = "log_" + sDbName + "_" + sTableName + ".log";                
                
        this.sDbName = sDbName;
        this.sTableName = sTableName;
        
        this.sLogDir = sLogDir;
        this.sLogFileName = sLogFileName;    
        
        this.pLogDir = Files.createDirectories(Paths.get(sLogDir));
        this.pLogFilePath = Paths.get(sLogDir, sLogFileName);
        
        String start = Util._nowStr_dateTime();
        String firstString = String.format(
                "Каталог %s\n" + 
                "Файл %s\n" + 
                "Вставка в БД %s, таблицу %s.\n" +                
                "Время начала логгирования %s\n",
                sLogDir, sLogFileName, sDbName, sTableName, start);
                
        Files.write(this.pLogFilePath, firstString.getBytes(),  StandardOpenOption.CREATE, 
                                                                StandardOpenOption.APPEND);
    }
    
    public void _write (String msg) throws IOException {
        Files.write(this.pLogFilePath, (msg + "\n").getBytes(),  StandardOpenOption.WRITE, 
                                                        StandardOpenOption.APPEND);        
        logback.info(String.format("%s %30s.%-10s: %s", ConfJDBC.LOG_PEFIX, sDbName, sTableName, msg));
    }
    
    public void _log (String col_1, String col_2) throws IOException {        
        String msg = String.format("%-8s\t%s", col_1, col_2);        
        Files.write(this.pLogFilePath, (msg + "\n").getBytes(),  StandardOpenOption.WRITE, 
                                                        StandardOpenOption.APPEND);            
        logback.info(String.format("%s %30s.%-10s: %s", ConfJDBC.LOG_PEFIX, sDbName, sTableName, msg));
    }
    
    public void _log (long col_1, long col_2) throws IOException {        
        String msg = String.format("%-8s\t%s", col_1, col_2);        
        Files.write(this.pLogFilePath, (msg + "\n").getBytes(),  StandardOpenOption.WRITE, 
                                                        StandardOpenOption.APPEND); 
        logback.info(String.format("%s %30s.%-10s: %s", ConfJDBC.LOG_PEFIX, sDbName, sTableName, msg));
    }
}
