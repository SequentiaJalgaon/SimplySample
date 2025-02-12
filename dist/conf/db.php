<?php
date_default_timezone_set("Asia/Kolkata");
class Database {

  private static $dbName = 'zecciunm_simplysample' ; 
  private static $dbHost = 'localhost' ;
  private static $dbUsername = 'zecciunm_simplysample';
  private static $dbUserPassword = '+qiLkyLb,{R*';
  private static $cont  = null;
   
  //  ------------------------------------------------------------
  
  // private static $dbName = 'simplysample_niranjan'; 
  // private static $dbHost = 'localhost';
  // private static $dbUsername = 'root';
  // private static $dbUserPassword = '';
  // private static $cont  = null;

 
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