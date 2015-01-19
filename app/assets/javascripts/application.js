// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function() {
  var clickCount1 = 0;
  var clickCount2 = 0;
  var clickCount3 = 0;
  var clickCount4 = 0;

  
  $('li').click(function(){

    var choice = $(this).attr('id');
   //     choices array numbers
    var optionsInList = $(this).attr('id').split('-')[2];
    var scenariosInList = $(this).attr('id').split('-')[1];

    if(scenariosInList ==0){
      clickCount1++;

      
      if(clickCount1 == 1 ){
           console.log('scenario:'+scenariosInList+' options:'+optionsInList)
          $('#Choice'+'-'+scenariosInList+'-'+'1')[0].value= optionsInList;
          $(this).css('background-color','lightgreen');
      }
      else if(clickCount1 ==2){
          $('#Choice'+'-'+scenariosInList+'-'+'2')[0].value=optionsInList;
          $(this).css('background-color','yellow');
      }
    }
    else if (scenariosInList ==1){
      clickCount2++;

      if(clickCount2 == 1 ){
           console.log('scenario:'+scenariosInList+' options:'+optionsInList)
          $('#Choice'+'-'+scenariosInList+'-'+'1')[0].value= optionsInList;
          $(this).css('background-color','lightgreen');
      }
      else if(clickCount2 ==2){
          $('#Choice'+'-'+scenariosInList+'-'+'2')[0].value=optionsInList;
          $(this).css('background-color','yellow');
      }
    }
    else if (scenariosInList ==2){
      clickCount3++;
      
      if(clickCount3 == 1 ){
           console.log('scenario:'+scenariosInList+' options:'+optionsInList)
          $('#Choice'+'-'+scenariosInList+'-'+'1')[0].value= optionsInList;
          $(this).css('background-color','lightgreen');
      }
      else if(clickCount3 ==2){
          $('#Choice'+'-'+scenariosInList+'-'+'2')[0].value=optionsInList;
          $(this).css('background-color','yellow');
      }
    }
    else if (scenariosInList ==3){
      clickCount4++;

      if(clickCount4 == 1 ){
           console.log('scenario:'+scenariosInList+' options:'+optionsInList)
          $('#Choice'+'-'+scenariosInList+'-'+'1')[0].value= optionsInList;
          $(this).css('background-color','lightgreen');
      }
      else if(clickCount4 ==2){
          $('#Choice'+'-'+scenariosInList+'-'+'2')[0].value=optionsInList;
          $(this).css('background-color','yellow');
      }
    }

    
  });
   $('Button').click(function(){
      var scenariosInButton = $(this).attr('id').split('-')[1];
      if(scenariosInButton == 0 ){
        clickCount1 = 0;
        $('#Choice'+'-'+scenariosInButton+'-'+'1')[0].value= null;
        $('#Choice'+'-'+scenariosInButton+'-'+'2')[0].value= null;
        jQuery.each( $('#optionList-0 li'), function( i, val ){
          $(val).css('background-color','white');
    
        });
      }
      else if(scenariosInButton == 1 ){
          clickCount2 = 0;
          $('#Choice'+'-'+scenariosInButton+'-'+'1')[0].value= null;
          $('#Choice'+'-'+scenariosInButton+'-'+'2')[0].value= null;
          jQuery.each( $('#optionList-1 li'), function( i, val ){
            $(val).css('background-color','white');
      
          });
        }
      else if(scenariosInButton == 2 ){
          clickCount3 = 0;
          $('#Choice'+'-'+scenariosInButton+'-'+'1')[0].value= null;
          $('#Choice'+'-'+scenariosInButton+'-'+'2')[0].value= null;
          jQuery.each( $('#optionList-2 li'), function( i, val ){
            $(val).css('background-color','white');
      
          });
        }
      else if(scenariosInButton == 3 ){
          clickCount4 = 0;
          $('#Choice'+'-'+scenariosInButton+'-'+'1')[0].value= null;
          $('#Choice'+'-'+scenariosInButton+'-'+'2')[0].value= null;
          jQuery.each( $('#optionList-3 li'), function( i, val ){
            $(val).css('background-color','white');
      
          });
        }
    });

});