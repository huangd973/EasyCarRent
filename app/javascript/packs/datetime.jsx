// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

window.Post = createReactClass({
  render: function() {
    return <h1>{this.props.title}</h1>
  }
})

// or, equivalent:
class Post extends React.Component {
  render() {
    return <h1>{this.props.title}</h1>
  }
}
