expect = require 'expect.js'
{render, crel, input, normalizeArgs} = require '../src/teact'

describe 'custom crel', ->
  it 'should render', ->
    template = -> crel 'custom'
    expect(render template).to.equal '<custom></custom>'
  it 'should render empty given null content', ->
    template = -> crel 'custom', null
    expect(render template).to.equal '<custom></custom>'
  it 'should render with attributes', ->
    template = -> crel 'custom', id: 'bar'
    expect(render template).to.equal '<custom id="bar"></custom>'
  it 'should render with attributes and content', ->
    template = -> crel 'custom', id: 'bar', 'zag'
    expect(render template).to.equal '<custom id="bar">zag</custom>'
