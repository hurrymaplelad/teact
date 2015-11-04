expect = require 'expect.js'
{img, br, link} = require '../src/teact'
{render} = require './helpers'

describe 'Self Closing Tags', ->
  describe '<img/>', ->
    it 'should render', ->
      expect(render img).to.equal '<img/>'
    it 'should render with attributes', ->
      expect(render -> img src: 'http://foo.jpg.to')
        .to.equal '<img src="http://foo.jpg.to"/>'
    it 'should throw when passed content', ->
      expect(-> render(-> img 'with some text')).to.throwException /must not have content/
  describe '<br/>', ->
    it 'should render', ->
      expect(render br).to.equal '<br/>'
  describe '<link/>', ->
    it 'should render with attributes', ->
      expect(render -> link href: '/foo.css', rel: 'stylesheet')
        .to.equal '<link href="/foo.css" rel="stylesheet"/>'
