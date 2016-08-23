@Posts = React.createClass
	getInitialState: ->
      posts: @props.data
    getDefaultProps: ->
      posts: []
    addRecord: (post) ->
      posts = @state.posts.slice()
      posts.push post
      @setState posts: posts
    deleteRecord: (post) ->
      posts = @state.posts.slice()
      index = posts.indexOf post
      posts.splice index, 1
      @replaceState posts: posts
    render: ->
      React.DOM.div
        className: 'records'
        React.DOM.h2
          className: 'title'
          'Posts List'
        React.createElement PostForm, handleNewRecord: @addRecord
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Description'
              React.DOM.th null, 'Actions'
          React.DOM.tbody null,
            for post in @state.posts
              React.createElement Post, key: post.id, post: post, handleDeleteRecord: @deleteRecord