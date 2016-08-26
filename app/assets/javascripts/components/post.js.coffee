@Post = React.createClass
	getInitialState: ->
      edit: false
    handleToggle: (e) ->
      e.preventDefault()
      @setState edit: !@state.edit
    handleEdit: (e) ->
      e.preventDefault()
      data =
        title: ReactDOM.findDOMNode(@refs.title).value
        description: ReactDOM.findDOMNode(@refs.description).value
      # jQuery doesn't have a $.put shortcut method either
      $.ajax
        method: 'PUT'
        url: "/posts/#{ @props.post.id }"
        dataType: 'JSON'
        data:
          post: data
        success: (data) =>
          @setState edit: false
          @props.handleEditRecord @props.post, data
	handleDelete: (e) ->
      e.preventDefault()
      # yeah... jQuery doesn't have a $.delete shortcut method
      $.ajax
        method: 'DELETE'
        url: "/posts/#{ @props.post.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteRecord @props.post
    recordRow: ->
      React.DOM.tr null,
        React.DOM.td null, @props.post.title
        React.DOM.td null, @props.post.description
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-default'
            onClick: @handleToggle
            'Edit'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'Delete'
    recordForm: ->
      React.DOM.tr null,
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.post.title
            ref: 'title'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.post.description
            ref: 'description'
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-default'
            onClick: @handleEdit
            'Update'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleToggle
            'Cancel'
    render: ->
      if @state.edit
        @recordForm()
      else
        @recordRow()