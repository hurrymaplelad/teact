{Suite} = require 'benchmark'
React = require 'react'
{crel} = require '../../src/teact'
{render} = require '../helpers'

new Suite()
  .add 'native', ->
    render ->
      React.createElement('div', {className: 'foo'},
        React.createElement 'div', {className: 'bar'}
      )

  .add 'teact', ->
    render ->
      crel 'div', '.foo', ->
        crel 'div', '.bar'

  .on 'cycle', (event) ->
    console.log String event.target

  .on 'complete', ->
    console.log "Fastest is #{@filter('fastest').pluck('name')}"

  .run async: true
