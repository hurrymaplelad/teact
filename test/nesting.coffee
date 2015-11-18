expect = require 'expect.js'
{div, span, p, pureComponent} = require '../src/teact'
{render} = require './helpers'

describe 'nesting templates', ->
  user =
    first: 'Huevo'
    last: 'Bueno'

  it 'renders nested template in the same output', ->

    nameHelper = (user) ->
      p "#{user.first} #{user.last}"

    template = (user) ->
      div ->
        nameHelper user

    expect(render template, user).to.equal '<div><p>Huevo Bueno</p></div>'

  describe 'pureComponent', ->
    it 'returns components without adding them to the parent stack', ->

      nameHelper = pureComponent (user) ->
        [
          span user.first
          span user.last
        ].reverse()

      template = (user) ->
        div nameHelper(user)

      expect(render template, user).to.equal '<div><span>Bueno</span><span>Huevo</span></div>'
