# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# coding: utf-8

function doDelete(id) {
  if (confirm("このミーティングを削除しますか？")) {
    location.href = /meeting/delete?id=" + id
  }


}


