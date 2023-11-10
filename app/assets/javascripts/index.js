$(document).one('click', '.note_div', function(e) {
  e.preventDefault();
    // var noteId = $(this).data('note-id');
    var noteId = $(this).attr('id').split('-')[1];
   $.ajax({
       type: 'PATCH',
       url: '/notes/' + noteId + '/edit' ,
       method: 'GET',
   });
 });
