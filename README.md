# Teact

It's [better than cjsx](#how-is-this-better-than-cjsx).

Build React element trees by composing functions.  
You get full javascript control flow, and minimal boilerplate.
It's also quite simple, just a thin wrapper around [React.createElement](https://facebook.github.io/react/docs/top-level-api.html#react.createelement) like JSX, making [fast](#performance) and lightweight (2KB gzipped).

[![Build Status](http://img.shields.io/travis/hurrymaplelad/teact.svg?style=flat-square)](https://travis-ci.org/hurrymaplelad/teact)
[![NPM version](http://img.shields.io/npm/v/teact.svg?style=flat-square)](https://www.npmjs.org/package/teact)

## Usage
```coffee
{crel} = require 'teact'

crel 'div', '#root.container', ->
  unless props.signedIn
    crel 'button', onClick: handleOnClick, 'Sign In'
  crel.text 'Welcome!'
```

Transforms into:

```coffee
React.createElement('div',
  {id: root, className: 'container'}, [
    (props.signedIn ? React.createElement('button',
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
    crel 'div', className: 'foo', =>
      crel 'div', 'bar'
```

Or in a [stateless component](https://facebook.github.io/react/docs/reusable-components.html#stateless-functions):

```coffee
module.exports = (props) ->
  crel 'div', className: 'foo', ->
    crel 'div', props.bar
```

### Nesting Components

`crel` is just a thin wrapper around [React.createElement](https://facebook.github.io/react/docs/top-level-api.html#react.createelement),
so you can pass it components instead of crel names:

```coffee
class DooDad extends Component
  render: ->
    crel 'div', className: 'doodad', =>
      crel 'span', @props.children

class Widget extends Component
  handleFiddle: =>
    # ...

  render: ->
    crel 'div', className: 'foo', =>
      crel DooDad, onFiddled: @handleFiddle, =>
        crel 'div', "I'm passed to DooDad.props.children"
```

### Sugar Syntax
Teact exports bound functions for elements, giving you options for
terser syntax if you're into that:

```coffee
T = require 'teact'

T.div className: 'foo', ->
  T.text 'Blah!'
```

or the Teacup / CoffeeCup signatures:

```coffee
{div, text} = require 'teact'

div '.foo', ->
  text 'Blah!'
```

## Performance

A [super-basic performance test](test/benchmarks/index.coffee) suggests that teact has no discernible impact on React rendering performance:

```sh
$ npm run benchmark

> native x 5,197 ops/sec ±3.30% (76 runs sampled)
> teact x 5,339 ops/sec ±2.23% (82 runs sampled)
> Fastest is teact,native
```

It's also lightweight, at 5KB minified, 2KB gzipped.  

## How is this better than CJSX?

- Familiar control flow with branching and loops.  See examples above.
- No transpiler to [maintain](https://github.com/jsdf/coffee-react/issues/28).
- No [extraneous enclosing tags](https://babeljs.io/repl/#?experimental=false&evaluate=true&loose=false&spec=false&code=%3Cdiv%3E%3C%2Fdiv%3E%0A%3Cdiv%3E%3C%2Fdiv%3E) required:
  ```coffee
  renderHeader: ->
    unless @props.signedIn
      crel 'a', href: '...', 'Sign in'
    crel 'h1', 'Tea Shop'
  ```
  Just works.
- [Nice syntax errors](https://github.com/jsdf/coffee-react/issues/32).
- Half the lines of code. Those closing tags really add up.

Other folks have [reached similar conclusions](https://slack-files.com/T024L9M0Y-F02HP4JM3-80d714).  They were later [bit by using the React API directly](https://github.com/planningcenter/react-patterns#jsx) when the implementation changed.  A thin wrapper like Teact should minimize this risk.

## Legacy

[Markaby](http://github.com/markaby/markaby) begat [CoffeeKup](http://github.com/mauricemach/coffeekup) begat
[CoffeeCup](http://github.com/gradus/coffeecup) and [DryKup](http://github.com/mark-hahn/drykup) which begat
[Teacup](http://github.com/goodeggs/teacup) which begat **Teact**.

## Contributing

```sh
$ git clone https://github.com/hurrymaplad/teact && cd teact
$ npm install
$ npm test
```
