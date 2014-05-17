Todos.TodosController = Ember.ArrayController.extend(
  actions:
    createTodo: ->

      # Get the todo title set by the "New Todo" text field
      title = @get("newTitle")
      return  unless title.trim()

      # Create the new Todo model
      todo = @store.createRecord("todo",
        title: title
        isCompleted: false
      )

      # Clear the "New Todo" text field
      @set "newTitle", ""

      # Save the new model
      todo.save()
      return

    clearCompleted: ->
      completed = @filterBy("isCompleted", true)
      completed.invoke "deleteRecord"
      completed.invoke "save"
      return

  remaining: (->
    @filterBy("isCompleted", false).get "length"
  ).property("@each.isCompleted")
  completed: (->
    @filterBy("isCompleted", true).get "length"
  ).property("@each.isCompleted")
  inflection: (->
    remaining = @get("remaining")
    (if remaining is 1 then "todo" else "todos")
  ).property("remaining")
  hasCompleted: (->
    @get("completed") > 0
  ).property("completed")
  allAreDone: ((key, value) ->
    if value is `undefined`
      !!@get("length") and @isEvery("isCompleted")
    else
      @setEach "isCompleted", value
      @invoke "save"
      value
  ).property("@each.isCompleted")
)
