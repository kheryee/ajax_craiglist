$(document).ready(function(){

  $( "#new_post" ).submit(function( event ) {
    event.preventDefault();

    var input = $(this).serialize();

    $.ajax({
      type: 'post',
      url: '/post_complete',
      data: input,
      success: function(msg){
        $( "body" ).empty().append( msg );
      }
    })
  });


  $( "#update_post" ).submit(function( event ) {
    event.preventDefault();

    var input = $(this).serialize();

    $.ajax({
      type: 'post',
      url: '/edit',
      data: input,
      success: function(msg){
        $( "body" ).empty().append( msg );
      }
    })
  });

  $( ".edit_post" ).click(function() {
    event.preventDefault();

    $.ajax({
      type: 'get',
      url: $(this).attr("href"),
      success: function(msg){
        $( "body" ).empty().append( msg );
      }
    })
  });

  $(".category_name").click(function(){
    event.preventDefault();
   $.ajax({
        type: 'get',
        url: $(this).attr("href"),
        success: function(msg){
          $( 'body' ).empty().append( msg );
        }
      })
   });


  $(".post_name").click(function(){
    event.preventDefault();
   $.ajax({
        type: 'get',
        url: $(this).attr("href"),
        success: function(msg){
          $( "body" ).empty().append( msg );
        }
      })
   });

  $(".brand.home").click(function(){
    event.preventDefault();
   $.ajax({
        type: 'get',
        url: $(this).attr("href"),
        success: function(msg){
          $( "body" ).empty().append( msg );
        }
      })
   });


  $(".brand.new_post").click(function(){
    event.preventDefault();
   $.ajax({
        type: 'get',
        url: $(this).attr("href"),
        success: function(msg){
          $( "body" ).empty().append( msg );
        }
      })
   });




});