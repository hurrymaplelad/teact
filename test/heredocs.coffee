expect = require 'expect.js'
{render, script} = require '../src/teact'

describe 'HereDocs', ->
  it 'preserves line breaks', ->
    template = -> script """
      $(document).ready(function(){
        alert('test');
      });
    """
    expect(render template).to.equal '<script>$(document).ready(function(){\n  alert(&#x27;test&#x27;);\n});</script>'
