$ ->
  $("img").addClass("img-responsive")

  $(".front-item img").on 'click', (e) ->
    window.location = $(this).parent().find("a").attr("href")
