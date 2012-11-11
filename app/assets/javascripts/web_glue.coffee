class @WebGlue
  constructor: (@useCase, @gui, @storage)->
    AutoBind(@gui, @useCase)
    After(@useCase, 'refreshUiDummy', => @gui.showProducts(@useCase.getAllProducts()))
    After(@gui, 'showAllProducts', => @useCase.refreshUiDummy())
    After(@useCase, 'fetchAllDataDummy', => @storage.fetchAllData())
    After(@useCase, 'advancedSearchUseCase', (products) => @gui.showProducts(products))
    Before(@storage,"setData",(data) => @useCase.setData(data))
    After(@gui,"buildCartDummy", => @useCase.buildCart())
    Before(@gui,"pay",(firstname,secondname) => @useCase.pay(firstname,secondname))
    After(@useCase,"pay", => @storage.pay(@useCase.getBuyer()))
    After(@storage,"paidSuccessfull", => @useCase.orderSuccessFull())
    After(@useCase,"orderSuccessFull", => @gui.showConfirmed(@useCase.getBuyer()))
    After(@useCase,"showCartDummy", (orderItems) => @gui.showCart(orderItems))
    After(@storage,"setBuyer",(buyer_data) => @useCase.setBuyer(buyer_data))
    After(@useCase,"addToCart",(product_id) => @storage.addToCart(product_id))
    After(@useCase,"addToCart",(product_id) => @useCase.refreshUiDummy())
    After(@gui, 'showProduct', (product_id) => @useCase.getProduct(product_id))
    After(@gui, 'addToCartDummy', (product_id) => @useCase.addToCart(product_id))
    After(@gui, 'advancedSearch', (form_data) => @useCase.advancedSearch(form_data))
    After(@gui, 'showCategory', (category_id) => @useCase.getCategory(category_id))
    After(@useCase, 'getProductUseCase', (product) => @gui.showProductGui(product))
    After(@useCase, 'searchUseCase', (products) => @gui.searchGui(products))
    After(@gui, 'search', (text) => @useCase.search(text))
    After(@useCase, 'getCategoryUseCase', (category) => @gui.showCategoryGui(category))
    Before(@gui, 'showProducts', => @gui.showProductsTable())
    BeforeAll(@gui, ['showAdvancedSearchForm','showProductsTable','showProductGui','showCategoryGui','searchGui','show_buy_form','showConfirmed'], => @gui.refreshUi())
    AfterAll(@gui, ['showProductsTable','showProductGui','showCategoryGui','showProducts','searchGui'], => @gui.enableClicks())
    Before(@gui, 'showProductGui', => @gui.hideProductsTable())
    LogAll(@useCase)
    LogAll(@gui)
    ###
    After(@gui, 'enterKeyPressed', (content) => @useCase.addNewTask(new Task(content)))
    After(@useCase, 'addNewTask', @gui.addNewTask)
    Before(@useCase, 'showAll',  => @useCase.setInitialTasks(@storage.getTasks()))
    After(@useCase, 'showAll',  => @gui.showTasks(@useCase.todoTasks))
    AfterAll(@useCase,
            [
             'addNewTask',
             'updateTaskContent',
             'deleteTask',
             'completeAllTasks',
             'toggleTaskCompletion'
            ],
            => @storage.set("tasks", @useCase.todoTasks))

    After(@useCase, 'deleteTask', @gui.deleteTask)


    After(@useCase, 'completeTask', @gui.completeTask)
    After(@useCase, 'uncompleteTask', @gui.uncompleteTask)


    After(@useCase, 'editTaskContent', @gui.editTaskContent)
    After(@gui, 'taskContentDoubleClicked', @useCase.editTaskContent)

    After(@useCase, 'updateTaskContent', @gui.updateTaskContent)
    After(@gui, 'enterKeyPressedWhenEditing', @useCase.updateTaskContent)

    AfterAll(@useCase,
      [
        'addNewTask',
        'deleteTask',
        'completeAllTasks',
        'toggleTaskCompletion',
        'showAll',
      ],
        => @gui.showStats(@useCase.remainingTasks().length, @useCase.completedTasks().length))

    After(@gui, 'allTasksClicked', => @useCase.showAll())
    After(@gui, 'completedTasksClicked', => @useCase.showCompleted())
    After(@gui, 'remainingTasksClicked', => @useCase.showActive())

    After(@useCase, 'showActive', => @gui.showTasks(@useCase.remainingTasks()))
    After(@useCase, 'showCompleted', => @gui.showTasks(@useCase.completedTasks()))

    After(@gui, 'clearCompletedClicked', => @useCase.clearCompleted())
    After(@useCase, 'clearCompleted', (deletedTasks) => @gui.clearCompleted(deletedTasks))

    LogAll(@useCase)
    LogAll(@gui)

    ###

