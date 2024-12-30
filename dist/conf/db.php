<?php
date_default_timezone_set("Asia/Kolkata");
class Database {

  //  private static $dbName = 'a1622dey_gp_test' ; 
  //  private static $dbHost = 'localhost' ;
  //  private static $dbUsername = 'a1622dey_gp_test';
  //  private static $dbUserPassword = '=KV)(EaJ9ro^';
  //  private static $cont  = null;
   
  //  ------------------------------------------------------------
  
  // private static $dbName = 'simply_sample'; 
  private static $dbName = 'simplysample_niranjan'; 
  private static $dbHost = 'localhost';
  private static $dbUsername = 'root';
  private static $dbUserPassword = '';
  private static $cont  = null;

 
    public function __construct() {
        die('Init function is not allowed');
    }
    public static function connect()
    {
       // One connection through whole application
       if ( null == self::$cont )
       {      
        try
        {
          self::$cont =  new PDO( "mysql:host=".self::$dbHost.";"."dbname=".self::$dbName, self::$dbUsername, self::$dbUserPassword);  
        }
        catch(PDOException $e) 
        {
          die($e->getMessage());  
        }
       } 
       return self::$cont;
    }
     
    public static function disconnect()
    {
        self::$cont = null;
    }
	
} 
?>