
function doDelete(id) {
  if (confirm("ミーティング" + id + "を削除しますか？")) {
    location.href = "/meetings/delete?id=" + id
  }
}


