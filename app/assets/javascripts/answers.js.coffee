# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # hostname = 'localhost:3000'
  hostname = 'nqoot.francis.ph'
  
  $('.delete_answer').live 'click', () ->
    url = 'http://' + hostname + '/delete'
    id = $(this).attr('id')
    $.ajax
      type: 'POST'
      url: url
      data: 'id=' + id
      success: (data, code, xmlhttp) ->
        console.log('answer deleted')
        
  $('.add_vote').live 'click', () ->
    url = 'http://' + hostname + '/answer/vote/up'
    id = $(this).attr('id')
    $.ajax
      type: 'POST'
      url: url
      data: 'answer_id=' + id
      success: (data, code, xmlhttp) ->
        console.log('answer upvoted')
        
  $('.down_vote').live 'click', () ->
    url = 'http://' + hostname + '/answer/vote/down'
    id = $(this).attr('id')
    $.ajax
      type: 'POST'
      url: url
      data: 'answer_id=' + id
      success: (data, code, xmlhttp) ->
        console.log('answer downvoted')
        
  $('.endorse').live 'click', () ->
    url = 'http://' + hostname + '/answer/endorse'
    id = $(this).attr('id')
    $.ajax
      type: 'POST'
      url: url
      data: 'answer_id=' + id
      success: (data, code, xmlhttp) ->
        console.log('answer endorsed')
  
  $('.unendorse').live 'click', () ->
    url = 'http://' + hostname + '/answer/unendorse'
    id = $(this).attr('id')
    $.ajax
      type: 'POST'
      url: url
      data: 'answer_id=' + id
      success: (data, code, xmlhttp) ->
        console.log('answer unendorsed')
  
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
          