console.log 'Fittastic'

$ ->

  $('.ft-feed-item-button').on 'ajax:success', ->
    $button = $(this)
    value = $button.attr 'data-value'

    $button.off 'click'
    $button.addClass 'disabled'
    $button.html "Podbite o #{value} zł"

    $value = $button.closest('.ft-feed-item').find('[data-value-updatable]')
    $value.html parseInt(value) + parseInt($value.html())

  $('.ft-feed-item-button').on 'ajax:error', ->
    alert('error')
