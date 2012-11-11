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

  buildCart: =>
    @showCartDummy(@buyer.orderItems)

  showCartDummy: (orderItems) =>


  addToCart: (product_id) => 
    product = @findProductById(product_id)
    t = @buyer.orderItems.filter (order_item) =>
      order_item.product.id == product.id
    if t.length == 0
      @buyer.orderItems.push(new OrderItem(@findProductById(product_id)))
    else
      for i in [0..@buyer.orderItems.length-1]
        if @buyer.orderItems[i].product.id == product.id
          @buyer.orderItems[i].quantity+=1

  setBuyer: (buyer_data) =>
    @buyer = buyer_data[0]
    @buyer.orderItems = []
    orders = buyer_data[1]
    for orderItem in orders
      product = @findProductById(orderItem.product_id)
      @buyer.orderItems.push(new OrderItem(product,orderItem.quantity))
    @refreshUiDummy() #produkty i koszyk zostaly pobrane
  fetchAllDataDummy: => 
  getBuyer: =>
    return @buyer
  getAllProducts: => return @products
  getAllCategories: => return @categories
  refreshUiDummy: => 
  orderSuccessFull: =>
    @buyer.orderItems = []
  findProductById: (product_id) =>
    return (@products.filter (product) -> product.id == parseInt(product_id,10))[0]
  getProduct: (product_id) =>
    product = @findProductById(product_id)
    @getProductUseCase(product)
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

  pay: (firstname,secondname) =>
    @buyer.firstname = firstname
    @buyer.lastname = secondname

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


class @OrderItem
  constructor: (product,quantity = 1) ->
    @product = product
    @quantity = quantity

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
