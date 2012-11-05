# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  hostname = 'nqoot.francis.ph'
  
#  $('.delete_answer').live 'click', () ->
#    console.log('delete');
#    url = 'http://' + hostname + '/delete'
#    id = $(this).attr('id')
#    $.ajax
#      type: 'POST'
#      url: url
#      data: 'id=' + id
#      success: (data, code, xmlhttp) ->
  
  $('#add-answer').click (e) ->
    e.preventDefault()
    answer = $('#answer-text').val()
    qid = $('#question-id').val()
    anonimity = false
    if $('#anon-answer').attr('checked') == 'checked'
      anonimity = true
    query = 'answer=' + answer + '&anonimity=' + anonimity + '&question_id=' + qid
    url = 'http://'+ hostname + '/add/answer'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        $('#answer-text').val('')
          