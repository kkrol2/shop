class @CompleteTasksUseCase
  constructor: ->
    @products = []
    @categories = []
    @fetchAllData()
    #@todoTasks = []

  setData: (data) =>
    @products = data[0]
    @categories = data[1]
    for product in @products
      product.category =  (@categories.filter (category) -> category.id == product.category_id)[0]
    @refreshProducts()

  fetchAllData: =>
    $.get '/spa/getAllData', '', @setData, 'json'
  getAllProducts: => return @products
  getAllCategories: => return @categories
  refreshProducts: => 
  getProduct: (product_id) => @getProductUseCase((@products.filter (product) -> product.id == parseInt(product_id,10))[0])
  #calling this method will invoke showProductGui 
  getProductUseCase: (product) => 

  ###
  completedTasks: => @todoTasks.filter (task) -> task.completed
  remainingTasks: => @todoTasks.filter (task) -> not task.completed

  setInitialTasks: (tasks) =>
    @todoTasks = tasks

  showAll: =>
  showActive: =>
  showCompleted: =>

  addNewTask: (task) =>
    @todoTasks.push(task)

  editTaskContent: (task) =>

  updateTaskContent: (task, content) =>
    task.content = content

  deleteTask: (task) =>
    @todoTasks.remove(task)

  completeAllTasks: =>
    @todoTasks.map((task) => @completeTask(task))

  toggleTaskCompletion: (task) =>
    if task.completed
      @uncompleteTask(task)
    else
      @completeTask(task)

  completeTask: (task) =>
    task.complete()

  uncompleteTask: (task) =>
    task.uncomplete()

  clearCompleted: =>
    @completedTasks().each (task) => @deleteTask(task)

class @Task
  constructor: (@content, @completed=false) ->

  complete: =>
    @completed = true

  uncomplete: =>
    @completed = false
###
