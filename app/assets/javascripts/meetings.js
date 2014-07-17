
function doDelete(id, exist_minute) {
  if (confirm("ミーティング" + id + "を削除しますか？")) {
    if(exist_minute == 0) {
        location.href = "/meetings/delete?id=" + id
    }else {
        confirm("議事録が存在するミーティングは削除できません。")
        location.href = "/meetings/" + id
    }
  }
}


