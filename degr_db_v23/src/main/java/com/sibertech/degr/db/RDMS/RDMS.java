package com.sibertech.degr.db.RDMS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Информация о структуре СУБД (всех используемых базах данных)
 */
public class RDMS {
    
    private static String full_db_nodeName = "db__full";
    
    private static ArrayList   <RDMS>  shards  = new ArrayList<>();
    private static Map<Integer, RDMS>  mapShardsById = new HashMap<>();
    private static Map<String,  RDMS>  mapShardsByName = new HashMap<>();
    
    private static Map<String,  RDMS>  mapAllNodesByName = new HashMap<>();
    
    private int     idx;  // = Region::id        
    private Boolean isShard;      
    private String  nodeName;  // имя региона -типа "tomsk", в нижнем регистре. Для полной БД - "full-db"=full_db_nodeName
    private String  nodeDescription;  

    private static int shardCount = 0;  // = Region::id        
    private static int runner = 0;
    
    public static RDMS  Node_DB__FULL          = new RDMS (full_db_nodeName, runner++, false);    
    
    public static RDMS  Node_SHARD_TOMSK       = new RDMS ("Tomsk",          runner++, true);
    public static RDMS  Node_SHARD_MOSCOW      = new RDMS ("Moscow",         runner++, true);
    public static RDMS  Node_SHARD_SAMARA      = new RDMS ("Samara",         runner++, true);
    public static RDMS  Node_SHARD_NOVOSIBIRSK = new RDMS ("Novosibirsk",    runner++, true);
    public static RDMS  Node_SHARD_OREL        = new RDMS ("Orel",           runner++, true);
    public static RDMS  Node_SHARD_KEMEROVO    = new RDMS ("Kemerovo",       runner++, true);
    public static RDMS  Node_SHARD_BARNAUL     = new RDMS ("Barnaul",        runner++, true);
    public static RDMS  Node_SHARD_SMOLENSK    = new RDMS ("Smolensk",       runner++, true);
    public static RDMS  Node_SHARD_BELGOROD    = new RDMS ("Belgorod",       runner++, true);
    public static RDMS  Node_SHARD_TULA        = new RDMS ("Tula",           runner++, true);
    
    private RDMS (String regionName, int idx, boolean isShard) {
        
        this.idx  = idx;
        this.nodeName = regionName.toLowerCase();        
        this.isShard = isShard;
        
        this.mapAllNodesByName.put(this.nodeName, this);
        
        if (!isShard){
            this.nodeDescription = String.format("Basket collection of all regions");        
            return;
        }
        
        this.nodeDescription = String.format("Basket collection of Shard %s", regionName);
        this.shards.add(this);
        this.mapShardsById.put(idx, this);
        this.mapShardsByName.put(this.nodeName, this);   

        RDMS.shardCount++;            
            
    }

    public String  getNodeName () {return nodeName;}   
    public boolean isNodeShard () {return this.isShard;}   
    public int     getIdx      () {return idx;}   
   
    public static boolean isShard(String nodeName) throws Exception {        
        boolean isPresented = mapAllNodesByName.containsKey(nodeName);
        if (!isPresented)
            throw new Exception(String.format("Такого (%s) узла среди RDMS нет!", nodeName));        
        RDMS node = mapAllNodesByName.get(nodeName);
        return node.isShard;
    }

    public static ArrayList<RDMS> getShards() {
        return shards;
    }
    public static Map<Integer, RDMS> getMapShardsById() {
        return mapShardsById;
    }
    public static Map<String, RDMS> getMapShardsByName() {
        return mapShardsByName;
    }  
    public static RDMS getNode (String name) {
        RDMS node = mapShardsByName.get (name.toLowerCase());
        return node;
    }
    public static RDMS getNode (int idx) {
        RDMS node = mapShardsById.get (idx);
        return node;
    }
    public static int getShardCount() {
        return shardCount;
    }
    public static boolean isShardNode (int idx) {        
        RDMS node = mapShardsById.get (idx);        
        return node.isShard;
    }    
    public static boolean isShardNode (String name) {        
        RDMS node = mapShardsByName.get (name.toLowerCase());
        return node.isShard;
    }        
    public String getNodeDescription() {
        return nodeDescription;
    }
}
