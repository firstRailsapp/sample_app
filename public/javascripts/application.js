var count;
$(document).ready(function() {       
    checkStatus();   
});
function checkStatus() {    
    $.ajax({              
        url: '/status',        
        success: function(xhr) {              
            count = parseInt(xhr);            
        },
        error: function(xhr) {            
            $("body").load(xhr.status + " " + xhr.statusText);            
        },
        complete:function() {           
            if (count < 100) {               
                progressUpdate(count);
                checkStatus();
            } else { 
                progressUpdate(count);                
                $("body").load("/result");                 
        }          
        }    
    });
}

function progressUpdate(count) {
    $("#progressbar").progressbar({value: count});
    $("#percentage").html(count + "%");
}






/*function checkingStatus() {
    $.ajax({
        '/result',
        success:function(xhr){
           if (xhr == 'sleep'){
               alert('sleep');
               checkStatus();
           }
        }
        });     
}   

function requestUpdate() {
    $.get(
        '/search',
        function(response) {                      
            var status = parseInt(response);               
            if (status < 100) {   
                progressUpdate(status);
                setTimeout('requestUpdate()', 1000);
            }                 
            else {             
                progressUpdate(status);
                $("body").load("/result");
            }
        });
}
function progressUpdate(Count) {   
    var progressCount = Count;
    $("#progressbar").progressbar({value: progressCount});
    $("#percentage").html(progressCount + "%");
}































                      
                     $("#progressbar").progressbar({value: 0});       
                       $.ajax({              
                                  url: '/result',            
                                  //ajaxStart:$.get("javascripts/result.js", function(){ sleep();}),                  
                                  success: function(response) {  
                                      if(response.)
                                      $("body").load('/result');              
                                  },
                                  error: function(xhr) {                
                                      $("#content").text(xhr.status+" "+xhr.statusText);
                                  }
                       });
 
                  
                      
});


function progressUpdate() {
    $("#progressbar").progressbar({value: ProgressCount });
    $("span").html(ProgressCount+"%");
    ProgressCount += 25;
}

    $.get('/result',function(data){alert("got result");});        
 var sleepFunction = function() {
 ProgressCount += 10;       
 $("#progressbar").progressbar({value: ProgressCount });
 $("span").html(ProgressCount+"%");
 };
 
 $.ajax({              
 url: '/result',            
   ajaxStart:$.get("javascripts/result.js", function(){ sleep();}),
 delay: {
 sleepFunction,
 1000
 },
 success: function(response) {                  
 $("body").load('/result');              
 },
 error: function(xhr) {                
 $("#content").text(xhr.status+" "+xhr.statusText);
 }
 
 });         
    
 if (ProgressCount <=100) {                    
 $("#progressbar").progressbar({value: ProgressCount });
 $("span").html(ProgressCount+"%");
 setTimeout('sleep()', 450);       
 }  


    var xhr = new XMLHttpRequest();                      
                      xhr.onreadystatechange = function() {
                          //alert(xhr.readyState);
                          switch(xhr.readyState) {                              
                              case  1:
                                     progressUpdate();                                        
                                     break;
                              case  2:
                                     progressUpdate();                                       
                                     break;
                              case  3:
                                     progressUpdate();                                      
                                     break;
                              case  4:
                                     progressUpdate();                
                                     if(xhr.status >=200 && xhr.status <= 300) {
                                     $("body").load("/result");
                                     } else {
                                     $("body").load(xhr.status+" "+xhr.statusText);
                                     }
                                     break;
                         } 
                          
                      };

                    xhr.open('GET', '/result');
                    xhr.send();
  */     


