$(document).ready ->
  if window.location.pathname.length > 1
    url = window.location.pathname
    substr = url.split("/")
    urlaspx = substr[substr.length - 1]
    $(".nav").find(".active").removeClass "active"
    $(".nav li a").each ->
      $(this).parent().addClass "active"  if @href.indexOf(urlaspx) >= 0
      return

  return