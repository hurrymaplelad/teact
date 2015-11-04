expect = require 'expect.js'
{render, raw, script, escape, h1, input} = require '../src/teact'

describe 'Auto escaping', ->
  describe 'a script crel', ->
    it "adds HTML entities for sensitive characters", ->
      template = -> h1 "<script>alert('\"owned\" by c&a &copy;')</script>"
      expect(render template).to.equal "<h1>&lt;script&gt;alert(&#x27;&quot;owned&quot; by c&amp;a &amp;copy;&#x27;)&lt;/script&gt;</h1>"

  it 'escapes crel attributes', ->
    template = -> input name: '"pwned'
    expect(render template).to.equal '<input name="&quot;pwned"/>'

  it 'escapea single quotes in crel attributes', ->
    template = -> input name: "'pwned"
    expect(render template).to.equal '<input name="&#x27;pwned"/>'

describe 'script crel', ->
  it 'escapes /', ->
    user = name: '</script><script>alert("alert");</script>'
    template = ->
      script "window.user = #{JSON.stringify user}"

    expect(render template).to.equal '<script>window.user = {&quot;name&quot;:&quot;&lt;/script&gt;&lt;script&gt;alert(\\&quot;alert\\&quot;);&lt;/script&gt;&quot;}</script>'
