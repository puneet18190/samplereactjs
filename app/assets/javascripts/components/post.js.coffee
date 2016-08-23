@Post = React.createClass
	handleDelete: (e) ->
      e.preventDefault()
      # yeah... jQuery doesn't have a $.delete shortcut method
      $.ajax
        method: 'DELETE'
        url: "/posts/#{ @props.post.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteRecord @props.post
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.post.title
        React.DOM.td null, @props.post.description
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'Delete'