# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  HOSTNAME = 'localhost:3000'
  
  $('.delete_answer').live 'click', () ->
    url = 'http://' + HOSTNAME + '/delete'
    id = $(this).attr('id')
    $.ajax
      type: 'POST'
      url: url
      data: 'id=' + id
      success: (data, code, xmlhttp) ->
        console.log('#answer-' + id)
        $('#answer-' + id).remove()
  
  update_page = (xmlhttp) ->
    data = eval('(' + xmlhttp.responseText + ')')
    answer = data.answer
    user = data.user
    timestamp = data.timestamp
    answer_id = data.answer_id
    delete_link = ' | <a id="' + answer_id + '" class="delete_answer" style="cursor: pointer;">Delete</a>'
    
    new_question = '<div class="answer-area">' + '<span><strong>' + user + '</strong></span>' +
            '<p id="answer-text-display">' + answer + '</p>' + '<div class="display-auth"><p>Posted on ' + timestamp + delete_link + '</p></div></div>'
            
    $('#answers-panel').append(new_question)
    $('#answer-text').val('')
  
  $('#add-answer').click (e) ->
    e.preventDefault()
    answer = $('#answer-text').val()
    qid = $('#question-id').val()
    anonimity = false
    if $('#anon-answer').attr('checked') == 'checked'
      anonimity = true
    query = 'answer=' + answer + '&anonimity=' + anonimity + '&question_id=' + qid
    url = 'http://'+ HOSTNAME + '/add/answer'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        update_page(xmlhttp)
        