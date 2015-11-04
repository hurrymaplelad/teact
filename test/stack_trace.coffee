expect = require 'expect.js'
{render, div, p} = require '../src/teact'

describe 'stack trace', ->
  it 'should contain crel names', ->
    template = ->
      div ->
        p ->
          throw new Error()
    try
      render template
    catch error
      expect(error.stack).to.contain 'div'
      expect(error.stack).to.contain 'p'
