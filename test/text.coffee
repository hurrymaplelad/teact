expect = require 'expect.js'
{text, h1} = require '../src/teact'
{render} = require './helpers'

describe 'text', ->
  it 'renders text verbatim', ->
    expect(render -> text 'foobar').to.equal 'foobar'

  it 'renders numbers', ->
    expect(render -> text 1).to.equal '1'
    expect(render -> text 0).to.equal '0'
