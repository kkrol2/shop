class @WebGui
  constructor: ->
    $("#show_all_products").click( => @showAllProducts() )
    $("#advanced_search").click( => @showAdvancedSearchForm() )
    $("#advanced_search_submit").click( => @advancedSearchSubmit() )
    $("#search").click( => @search($('#search_text').attr('value')) )


  showProducts: (products) =>
   for product in products
      $("#products").append(@createElementFor(product,"#products_template"))
   
  
  showProductsTable: =>
    $("#products_table").show()

  showAdvancedSearchForm: =>
    $("#advanced_search_form").show()   

  hideAdvancedSearchForm: =>
    $("#advanced_search_form").hide()

  advancedSearchSubmit: =>
    form_data = { name: $('#search_name').attr('value'),description: $('#search_description').attr('value'),price_start: $('#search_price_begin').attr('value'),price_end: $('#search_price_end').attr('value') }
    @advancedSearch(form_data)

  advancedSearch: (data) => 

  hideProductsTable: =>
    $("#products_table").hide()

  showProduct: (product_id) =>
  showCategory: (category_id) =>
  showProductGui: (product) =>
    $("#product").html(@createElementFor(product,"#product_template"))
  showCategoryGui: (category) =>
    @showProductsTable()
    $("#category").html(@createElementFor(category,"#category_template"))
    for product in category.products
      $("#products").append(@createElementFor(product,"#products_template"))

  createElementFor: (data,templateId) =>
    source = $(templateId).html();
    template = Handlebars.compile(source)
    return template(data)

  showAllProducts: =>

  search: (text) =>

  searchGui: (products) =>
    @showProductsTable()
    for product in products
      $("#products").append(@createElementFor(product,"#products_template"))


  enableClicks: =>
    $(".product_show").click((e) => @showProduct($(e.currentTarget).attr('id')))
    $(".category_show").click((e) => @showCategory($(e.currentTarget).attr('id')))
    $("#cart").click((e) => @addToCartDummy($(e.currentTarget).attr('name')))

  addToCartDummy: (product_id) =>

  refreshUi: =>
    @hideProductsTable()
    @hideAdvancedSearchForm()
    $("#product").html("")
    $("#products").html("")
    $("#category").html("")
    $("#cartContainer").html("")
    @buildCartDummy()

  buildCartDummy: =>   

  showCart: (orderItems) =>
    for orderItem in orderItems
      elem = @createElementFor(orderItem,"#orderItem_template")
      $('#cartContainer').append(elem)

  ###
    $("#new-todo").keypress((event) => @keyPressed(event))
    $("#toggle-all").click( => @completeAllTasksClicked())
    @taskElements = []

  createElementFor: (task, templateId) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    data = {content: task.content, completed: task.completed}
    html = template(data)
    element = $(html)

  addNewTask: (task) =>
    element = @createElementFor(task, "#todo-template")
    element.task = task
    @taskElements.push(element)
    $("#todo-list").append(element)

    element.find(".destroy").click( => @deleteTaskClicked(task))
    element.find(".toggle").click( => @toggleTaskCompletionClicked(task))
    element.dblclick( => @taskContentDoubleClicked(task))

  findTaskElement: (task) => @taskElements.find((taskElement) -> taskElement.task == task)
  taskContentDoubleClicked: (task) =>

  deleteTaskClicked: (task) =>
  deleteTask: (task) => @findTaskElement(task).remove()


  editTaskContent: (task) =>
    element = @findTaskElement(task)
    element.addClass("editing").find("input.edit").show().select().focus()
    element.find("input.edit").keypress((event) => @editingKeyPressed(event, element))

  editingKeyPressed: (event, element) =>
    ENTER_KEY_CODE = 13
    if event.keyCode == ENTER_KEY_CODE
      @enterKeyPressedWhenEditing(element.task, element.find("input.edit").val())

  enterKeyPressedWhenEditing: (task, newContent) =>

  updateTaskContent: (task, content) =>
    element = @findTaskElement(task)
    element.removeClass("editing").find("input.edit").hide()
    element.find("label").html(content)

  completeTask: (task) =>
    element = @findTaskElement(task)
    element.addClass("completed")
    element.find("input.toggle").attr("checked", "checked")

  uncompleteTask: (task) =>
    element = @findTaskElement(task)
    element.removeClass("completed")
    element.find("input .toggle").attr("checked", "")

  showTasks: (tasks) =>
    $("#todo-list").html("")
    for task in tasks
      @addNewTask(task)

  completeAllTasksClicked: =>

  toggleTaskCompletionClicked: (task) =>

  keyPressed: (event) =>
    ENTER_KEY_CODE = 13
    if event.keyCode == ENTER_KEY_CODE
      @enterKeyPressed(@newTodoContent())
      @clearNewTodoTextBox()

  clearNewTodoTextBox: =>
    $("#new-todo").val("")

  newTodoContent: =>
    $("#new-todo").val()

  enterKeyPressed: (content) =>

  showStats: (remaining, completed) =>
    source = $("#stats-template").html()
    template = Handlebars.compile(source)
    moreThanOne = remaining > 1
    data = {remaining: remaining, moreThanOne: moreThanOne, completed: completed}
    html = template(data)
    element = $(html)
    element.find("#all-tasks").click => @allTasksClicked()
    element.find("#active-tasks").click => @remainingTasksClicked()
    element.find("#completed-tasks").click => @completedTasksClicked()
    console.log("here")
    $("#footer").html(element)
    $("#clear-completed").click => @clearCompletedClicked()

  allTasksClicked: =>
  completedTasksClicked: =>
  remainingTasksClicked: =>
  clearCompletedClicked: =>

  clearCompleted: (tasks)=>
    console.log("gui.clearCompleted")
    tasks.each (task) -> @deleteTask(task)

  ###
