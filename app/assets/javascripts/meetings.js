
function doDelete(id, exist_minute, exist_todo) {
  if (confirm("ミーティング" + id + "を削除しますか？")) {
    if(exist_minute != 0) {
        confirm("議事録が存在するミーティングは削除できません。")
        location.href = "/meetings/" + id
    }else if(exist_todo != 0) {
        confirm("ToDoが存在するミーティングは削除できません。")
        location.href = "/meetings/" + id
    }else {
        location.href = "/meetings/delete?id=" + id
    }
  }
}

jQuery(function() {
  $('#meeting_project_id').change(function() {
      var project_id = $('#meeting_project_id').val();
      $.get("meeting_users_select?project_id=" + project_id);
  });
});



