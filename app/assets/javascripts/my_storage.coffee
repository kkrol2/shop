class @MyStorage
  constructor: ->

  setData: (data) =>
    $.get '/spa/getBuyer', '', @setBuyer, 'json'
    
  setBuyer: (buyer_data) =>

  addToCart: (product_id) =>
    $.get '/spa/addToCart', 'id='+product_id, @checkIfSuccess, 'json'

  fetchAllData: =>
    $.get '/spa/getAllData', '', @setData, 'json'

  checkIfSuccess: (data) =>
    alert "success"