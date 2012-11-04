

class WebTodoApp
  constructor: ->

    useCase = new CompleteTasksUseCase()
    window.useCase = useCase
    gui = new WebGui()
    localStorage = new LocalStorage("todo_app")
    glue = new WebGlue(useCase, gui, localStorage)


new WebTodoApp()

