expect = require 'expect.js'
{crel, p, div, script} = require '../src/teact'
{render} = require './helpers'
{Component} = require 'react'

class DooDad extends Component
  render: ->
    props = @props
    crel 'div', className: 'doodad', ->
      crel.text props.label
      crel 'span', props.children

class Widget extends Component
  render: ->
    crel 'div', className: 'foo', ->
      crel DooDad, label: 'Doo', ->
        crel.text "I'm passed to DooDad.props.children"

describe 'components', ->
  it 'render with crel', ->
    expect(render ->
      crel DooDad, label: 'Boo'
    ).to.equal '<div class="doodad">Boo<span></span></div>'

describe 'nesting components', ->
  it 'supports a single child', ->
    expect(render ->
      crel Widget
    ).to.equal '<div class="foo"><div class="doodad">Doo<span>I&#x27;m passed to DooDad.props.children</span></div></div>'

  it 'supports a multipl children', ->
    expect(render ->
      crel DooDad, label: 'A', ->
        crel DooDad, label: 'B'
        crel DooDad, label: 'C'
    ).to.equal '<div class="doodad">A<span><div class="doodad">B<span></span></div><div class="doodad">C<span></span></div></span></div>'
