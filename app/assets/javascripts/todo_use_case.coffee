class @CompleteTasksUseCase
  constructor: ->
    @products = []
    @categories = []
    #@todoTasks = []

  setData: (data) =>
    @products = data[0]
    @categories = data[1]
    for i in [0..@products.length-1]
      @products[i] = new Product(@products[i],@categories)
    @refreshProducts()

  fetchAllData: => 
  getAllProducts: => return @products
  getAllCategories: => return @categories
  refreshProducts: => 
  getProduct: (product_id) => @getProductUseCase((@products.filter (product) -> product.id == parseInt(product_id,10))[0])
  getCategory: (category_id) =>
   category = (@categories.filter (category) -> category.id == parseInt(category_id,10))[0]
   category.products = @products.filter ( (product) -> (product.category_id == category.id))
   @getCategoryUseCase(category)
  #calling this method will invoke showProductGui 
  getProductUseCase: (product) => 
  getCategoryUseCase: (product) => 
  search: (text) => 
    res = @products.filter (product) -> product.filterName(text)
    @searchUseCase(res)

  advancedSearch: (data) =>
    res = @products.filter (product) => product.filterName(data.name) && product.filterDescription(data.description) && product.filterPrice(data.price_start,data.price_end)
    @advancedSearchUseCase(res)

  searchUseCase: (products) =>

  advancedSearchUseCase: (products) =>

class @Product
  constructor: (product,categories) ->
    @name = product.name
    @description = product.description
    @price = product.price
    @category = (categories.filter (cat) -> cat.id == product.category_id)[0]
    @id = product.id
    @category_id = product.category_id

  filterName: (text) =>
    if @name.toLowerCase().search(text.toLowerCase()) != -1
      return true
    return false

  filterDescription: (text) =>
    if @description.toLowerCase().search(text.toLowerCase()) != -1
      return true
    return false

  filterPrice: (a, b) =>
    if a=='' || b ==''
      return true
    if @price >= a && @price <= b
      return true
    return false
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
