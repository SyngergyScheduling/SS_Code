# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

team_value = 0

@genTF = ->
  input = document.createElement('input')
  input.setAttribute('type', 'text')
  input.setAttribute('placeholder', 'Team Name')
  input.setAttribute('id', "league_team#{team_value}")
  input.setAttribute('name', "league[team#{team_value}]")
  team_value += 1
  input

@genB = ->
  button = document.createElement('button')
  button.appendChild(document.createTextNode('-'))
  button.setAttribute('onClick', 'subInput(this.parentElement)')
  button

@genDiv = ->
  div = document.createElement('div')
  div.appendChild(genTF())
  #div.appendChild(genB())
  div

@addBox = ->
  div = document.getElementById('names')
  children = div.childNodes
  if children.length < 13
    document.getElementById('names').appendChild(genDiv())
 
@removeBox = ->
  div = document.getElementById('names')
  children = div.childNodes
# There are some items that are implicitly added
# to the div, therefore a div with only one text box
# has 4 children.
  if children.length > 4
    div.removeChild(children[children.length - 1])
    team_value -= 1
