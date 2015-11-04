expect = require 'expect.js'
{div, p} = require '../src/teact'
{render} = require './helpers'

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
