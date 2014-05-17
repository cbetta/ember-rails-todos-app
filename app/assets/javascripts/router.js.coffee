# For more information see: http://emberjs.com/guides/routing/

Todos.Router.map ()->
  this.resource 'todos', { path: '/' }, ->
    this.route 'active'
    this.route 'completed'

Todos.Router.reopen location: "history"
