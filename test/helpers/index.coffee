ReactDOM = require 'react-dom/server'

module.exports =
  render: (template, args...) ->
    element = template(args...)
    if typeof element is 'string' then element
    else ReactDOM.renderToStaticMarkup(element)
