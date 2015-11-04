expect = require 'expect.js'
{render, raw, cede, div, p, strong, a} = require '../src/teact'

describe 'render', ->
  describe 'nested in a template', ->
    it 'returns the nested template without clobbering the parent result', ->
      template = ->
        p dangerouslySetInnerHTML: __html: "This text could use #{render -> strong -> a href: '/', 'a link'}."
      expect(render template).to.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'

  it 'doesn\'t modify the attributes object', ->
    d = { id: 'foobar', href: 'http://example.com' }
    template = ->
      p ->
        a '.first', d, "link 1"
        a d, "link 2"
    expect(render template).to.equal '<p><a id="foobar" href="http://example.com" class="first">link 1</a><a id="foobar" href="http://example.com">link 2</a></p>'
