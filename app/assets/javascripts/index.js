$(document).on('click', '#note_div', function(e) {
  e.preventDefault();
    // var noteId = $(this).attr('id').split('-')[1];
    var noteId = $(this).data('note-id');
  $.ajax({
      type: 'PATCH',
      url: '/notes/' + noteId + '/edit/' ,
      method: 'GET',
  });
});
