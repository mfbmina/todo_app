$(document).on('click', '.close_task', function() {
  link = $(this);
  $.ajax({
    method: "PATCH",
    url: "/tasks/" + link.data().id + "/close",
  });
  return 1;
});
