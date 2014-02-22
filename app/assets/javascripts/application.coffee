#= require jquery
#= require jquery_ujs
#= require turbolinks

ready = ->
  console.log 'hello'

$(document).ready(ready)
$(document).on('page:load', ready)
