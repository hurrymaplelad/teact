expect = require 'expect.js'
{a, br, div} = require '../src/teact'
{render} = require './helpers'

describe 'Attributes', ->

  describe 'with a hash', ->
    it 'renders the corresponding HTML attributes', ->
      template = -> a href: '/', title: 'Home'
      expect(render template).to.equal '<a href="/" title="Home"></a>'

  describe 'data attribute', ->
    it 'expands attributes', ->
      template = -> br data: { name: 'Name', value: 'Value' }
      expect(render template).to.equal '<br data-name="Name" data-value="Value"/>'

  describe 'nested hyphenated attribute', ->
    it 'renders', ->
      template = ->
        div 'data-on-x': 'beep', ->
          div 'data-on-y': 'boop'
      expect(render template).to.equal '<div data-on-x="beep"><div data-on-y="boop"></div></div>'
