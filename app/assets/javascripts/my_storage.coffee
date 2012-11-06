class @MyStorage
  constructor: ->

  setData: (data) =>
    
    

  fetchAllData: =>
    $.get '/spa/getAllData', '', @setData, 'json'
