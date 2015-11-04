# Teact

It's better than cjsx.

Build React element trees by composing functions.  
You get full javascript control flow, and minimal boilerplate.
It's also quite simple, just a thin wrapper around [React.createElement](https://facebook.github.io/react/docs/top-level-api.html#react.createelement) like JSX.

[![Build Status](http://img.shields.io/travis/hurrymaplelad/teact.svg?style=flat-square)](https://travis-ci.org/hurrymaplelad/teact)
[![NPM version](http://img.shields.io/npm/v/teact.svg?style=flat-square)](https://www.npmjs.org/package/teact)

## Usage
```coffee
{crel} = require 'teact'

crel 'div', '#root.container', ->
  unless @props.signedIn
    crel 'button', onClick: handleOnClick, 'Sign In'
  crel 'text', 'Welcome!'
```

Transforms into:

```coffee
React.createElement('div',
  {id: root, className: 'container'}, [
    (@props.signedIn ? React.createElement('button',
      {onClick: handleOnClick}, 'Sign In'
    ) : null)
    'Welcome!'
  ]
)
```

Use it from your component's render method:
```coffee
{Component} = require 'react'
{crel} = require 'teact'

class Widget extends Component
  render: ->
    crel 'div', className: 'foo', ->
      crel 'div', 'bar'
```

Or in a [stateless component](https://facebook.github.io/react/docs/reusable-components.html#stateless-functions):

```coffee
module.exports = (props) ->
  crel 'div', className: 'foo', ->
    crel 'div', 'bar'
```

### Nesting Components

`crel` is just a thin wrapper around [React.createElement](https://facebook.github.io/react/docs/top-level-api.html#react.createelement),
so you can pass it components instead of crel names:

```coffee
class DooDad extends Component
  render: ->
    crel 'div', className: 'doodad', ->
      crel 'span', @props.children

class Widget extends Component
  handleFiddle: =>
    # ...

  render: ->
    crel 'div', className: 'foo', ->
      crel DooDad, onFiddled: @handleFiddle, ->
        crel 'div', "I'm passed to DooDad.props.children"
```

### Sugar Syntax
Teact exports bound functions for elements, giving you options for
terser syntax if you're into that:

```coffee
T = require 'teact'

T.div 'div', className: 'foo', ->
    T.text 'Blah!'
```

or the Teacup / CoffeeCup signatures:

```coffee
{div, text} = require 'teact'

div 'div', '.foo', ->
  text 'Blah!'
```

Legacy
-------

[Markaby](http://github.com/markaby/markaby) begat [CoffeeKup](http://github.com/mauricemach/coffeekup) begat
[CoffeeCup](http://github.com/gradus/coffeecup) and [DryKup](http://github.com/mark-hahn/drykup) which begat
[Teacup](http://github.com/goodeggs/teacup) which begat **React**.

Contributing
-------------

```sh
$ git clone https://github.com/hurrymaplad/teact && cd teact
$ npm install
$ npm test
```
