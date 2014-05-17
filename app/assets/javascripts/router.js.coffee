# For more information see: http://emberjs.com/guides/routing/

Todos.Router.map ()->
  this.resource 'todos', { path: '/' }, ->
    this.route 'active'
    this.route 'completed'

Todos.TodosRoute = Ember.Route.extend(model: ->
  @store.find "todo"
)

Todos.TodosActiveRoute = Ember.Route.extend(
  model: ->
    @store.filter "todo", (todo) ->
      not todo.get("isCompleted")


  renderTemplate: (controller) ->
    @render "todos/index",
      controller: controller

    return
)

Todos.TodosCompletedRoute = Ember.Route.extend(
  model: ->
    @store.filter "todo", (todo) ->
      todo.get "isCompleted"


  renderTemplate: (controller) ->
    @render "todos/index",
      controller: controller

    return
)
