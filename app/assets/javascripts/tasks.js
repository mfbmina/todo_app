$(document).on('click', '.close_task', function() {
  event.preventDefault();
  link = $(this);
  $.ajax({
    method: "PATCH",
    url: "/tasks/" + link.data().id + "/close",
  }).done(function(msg) {
    link.parents('tr').find('td:contains(false)').html(msg.closed);
    link.parents('tr').find('td:empty').html(moment(msg.closed_at).format('DD/MM/YYYY'));
    link.hide();
  });
});
