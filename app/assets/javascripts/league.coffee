# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@genTF = ->
  input = document.createElement('input')
  input.setAttribute('type', 'text')
  input.setAttribute('placeholder', 'Team Name')
  input

@genB = ->
  button = document.createElement('button')
  button.appendChild(document.createTextNode('-'))
  button.setAttribute('onClick', 'subInput(this.parentElement)')
  button
 
@genDiv = ->
  div = document.createElement('div')
  div.appendChild(genTF())
  div.appendChild(genB())
  div

@addBox = ->
  document.getElementById('names').appendChild(genDiv());
