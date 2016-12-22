ready = (fn) ->
  if (document.readyState != 'loading')
    fn()
  else
    document.addEventListener('DOMContentLoaded', fn);

ready ->
  [].forEach.call(document.querySelectorAll('img'), (img) ->
    if (img.classList)
      img.classList.add('img-responsive')
  )

  [].forEach.call(document.querySelectorAll('.front-item img'), (img) ->
    img.addEventListener 'click', (e) ->
      window.location = this.parentNode.querySelectorAll('a')[0].getAttribute('href')
  )

  return
