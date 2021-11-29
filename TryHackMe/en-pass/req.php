<?php
     
if($_SERVER["REQUEST_METHOD"] == "POST")
{
   $title = $_POST["title"];
   //preg_match Use a regular expression to do a case-insensitive search for "w3schools" in a string:
   if (!preg_match('/[a-zA-Z0-9]/i' , $title ))
   {
          
          $val = explode(",",$title);
          $sum = 0;
          
          for($i = 0 ; $i < 9; $i++)
          {
                if ( (strlen($val[0]) == 2) and (strlen($val[8]) ==  3 )) {

                    if ( $val[5] !=$val[8]  and $val[3]!=$val[7] ) 
                        $sum = $sum+ (bool)$val[$i]."<br>"; 
                }
          }

          if ( ($sum) == 9 )
          {
              echo $result;//do not worry you'll get what you need.
              echo " Congo You Got It !! Nice ";            
          }      

          else
          {
            echo "  Try Try!!";

                
          }
    }
        
        else
        {

          echo "  Try Again!! ";
        }     
}
?>