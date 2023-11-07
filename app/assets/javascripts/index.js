$(document).on('click', '#note_div', function(e) {
  e.preventDefault();
  var noteId = $(this).data('note-id');
  $.ajax({
      type: 'PATCH',
      url: '/notes/' + noteId + '/edit/' ,
      method: 'GET',
  });
});

// $(document).on('click', '.note-clickable', function() {
//   var noteId = $(this).attr('id').split('_')[1];
//   $.ajax({
//     url: '/notes/' + noteId + '/edit',
//     type: 'get',
//     dataType: 'script',
//   });
// });
