$(document).on('click', '#note_div', function(e) {
  e.preventDefault();
  var noteId = $(this).data('note-id');
  $.ajax({
      type: 'PATCH',
      url: '/notes/' + noteId ,
      method: 'GET',
  });
});
