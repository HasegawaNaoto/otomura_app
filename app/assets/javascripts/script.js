$(function(){
  $('#newpost-form-show').click(function () {
    $('#post-modal').show();
  })

  $('#notice-ok-btn').click(function(){
    $('#notice-modal').hide();
  })

  $('#newpost-form-show').click(function () {
    $('#post-modal').show();
  }),

  $(document).on('click', function(e) {
    if($(e.target).is('#post-modal')) {
      $('#new-post-destroy-modal').show();
    }
  })

  $('#post_cancel_btn').click(function(){
    $('#new-post-destroy-modal').show();
  })

  $('#new-post-modal-yes-btn').click(function(){
    $('#post-modal').hide();
    $('#list').after('<output id="list_new"></output>');
    $('#list').remove();
    $('#list_new').attr('id','list');
    $('#new-post-content').val("");
    $('#article_image_file_name').val("");
    $('#post_video').val("");
    $('#article_image_file_name_none').attr('id', 'article_image_file_name');
    $('.image_file_css').css('color', 'rgba(10,180,80,0.7)');
    $('.image_file_css').hover(function() {
      $(this).css('color', 'rgba(120,200,80,1)');
    }, function() {
      $(this).css('color', 'rgba(10,180,80,0.7)');
    })
    $('.image_file_css').css('cursor','pointer');
    $('#post_video_none').attr('id', 'post_video');
    $('.video_file_css').css('color', 'rgba(10,180,80,0.7)');
    $('.video_file_css').hover(function() {
      $(this).css('color', 'rgba(120,200,80,1)');
    }, function() {
      $(this).css('color', 'rgba(10,180,80,0.7)');
    })
    $('.video_file_css').css('cursor','pointer');
    $('#new-post-destroy-modal').hide();
  })

  $('#new-post-modal-no-btn').click(function(){
    $('#new-post-destroy-modal').hide();
  })

  $('#post-modal-no-btn').click(function(){
    $('#post-modal').hide();
    $('#list').after('<output id="list_new"></output>');
    $('#list').remove();
    $('#list_new').attr('id','list');
    $('#article_image_file_name').val("");
    $('#new-post-destroy-modal').hide();
  })

  $('#newpost-cancel-btn').click(function () {
    $('#list').after('<output id="list_new"></output>');
    $('#list').remove();
    $('#list_new').attr('id','list');
    $('#article_image_file_name').val("");
    $('#post_video').val("");
    $('#article_image_file_name_none').attr('id', 'article_image_file_name');
    $('.image_file_css').css('color', 'rgba(10,180,80,0.7)');
    $('.image_file_css').hover(function() {
      $(this).css('color', 'rgba(120,200,80,1)');
    }, function() {
      $(this).css('color', 'rgba(10,180,80,0.7)');
    })
    $('.image_file_css').css('cursor','pointer');

    $('#post_video_none').attr('id', 'post_video');
    $('.video_file_css').css('color', 'rgba(10,180,80,0.7)');
    $('.video_file_css').hover(function() {
      $(this).css('color', 'rgba(120,200,80,1)');
    }, function() {
      $(this).css('color', 'rgba(10,180,80,0.7)');
    })
    $('.video_file_css').css('cursor','pointer');
  })

  $('#friendlist-friend-btn').click(function () {
    $('#friend-modal').show();
  }),

  $(document).on('click', function(e) {
    if($(e.target).is('#friend-modal')) {
      $('#friend-modal').hide();
    }
  })

  $('#friend-btn').click(function () {
    $('#friend-modal').show();
  }),

  $(document).on('click', function(e) {
    if($(e.target).is('#friend-modal')) {
      $('#friend-modal').hide();
    }
  })

  $('.modal-no-btn').click(function () {
    $('#friend-modal').hide();
  })

  $('.close-modal').click(function () {
    $('#post-modal').fadeOut();
  })

  $('#header-logo').click(function(){
    $('html,body').animate({
      'scrollTop':0
    },500)
  })
})
