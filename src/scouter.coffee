class Scouter
  score: (str) ->
    selectors = @parse(str)

    # IDs
    a = selectors.filter((element) -> element.indexOf('#') != -1)

    # Classes, Attributes, Pseudo-Classes
    b = selectors.filter((element) ->
      element.match(/\[.+\]|\.[_a-zA-Z0-9-]|:[_a-zA-Z0-9-]/)?.length && element.indexOf('::') == -1
    )

    selectors = selectors.filter (i) -> !(a.concat(b).indexOf(i) > -1)

    # Type Selectors, Pseudo-Elements
    c = selectors

    score = parseInt("#{a.length}#{b.length}#{c.length}", 10)
    score

  parse: (str) ->
    selectors = []
    for selector in str.split(/[\s,+~>]+/)
      matches = selector.match(/\[.+\]|#[_a-zA-Z0-9-]*|\.[_a-zA-Z0-9-]*|::[_a-zA-Z0-9-]*|:[_a-zA-Z0-9-]*|[_a-zA-Z0-9-]*/gi)
      if matches
        for match in matches
          match = match.replace(/:not|\(|\)/ig, '')
          selectors.push(match) if match.length
      else
        selectors.push(selector)
    selectors

  sort: (selectors, order = 'desc') ->
    if order is 'desc'
      # Most specific
      selectors.sort (a, b) => @score(b) - @score(a)
    else
      # Least specific
      selectors.sort (a, b) => @score(a) - @score(b)
    selectors

root = exports ? window
root.Scouter = Scouter