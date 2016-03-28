tooltipable = ->
  $('.tooltipable').each (element, index) ->
    console.debug $('#'+$(this).attr('id')+'-tooltip')
    $(this).tooltip
      html: true
      title: $('#'+$(this).attr('id')+'-tooltip').html()


$(document).ready tooltipable
$(document).on 'page:load', tooltipable
