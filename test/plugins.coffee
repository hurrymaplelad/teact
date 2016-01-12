expect = require 'expect.js'
teact = require '../src/teact'

describe 'plugins', ->
  it 'are applied via use', ->
    expect(teact.use).to.be.a 'function'
