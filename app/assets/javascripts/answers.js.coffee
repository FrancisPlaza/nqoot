# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  update_page = (xmlhttp) ->
    data = eval('(' + xmlhttp.responseText + ')')
    answer = data.answer
    user = data.user
    timestamp = data.timestamp
    
    new_question = '<div class="answer-area">' + '<span><strong>' + user + '</strong></span>' +
            '<p id="answer-text-display">' + answer + '</p>' + '<div class="display-auth"><p>Posted on ' + timestamp + '</p></div></div>'
            
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
    url = 'http://localhost:3000/add/answer'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        update_page(xmlhttp)
        