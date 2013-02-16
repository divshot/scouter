describe 'Scouter', ->

  it 'can properly score the specificity of W3C\'s examples', ->
    scouter = new Scouter()
    selectors =
      '*': 0,
      'LI': 1,
      'UL LI': 2,
      'UL OL+LI': 3,
      'H1 + *[REL=up]': 11,
      'UL OL LI.red': 13,
      'LI.red.level': 21,
      '#x34y': 100,
      '#s12:not(F00)': 101

    for selector, score of selectors
      expect(scouter.score(selector)).toBe(score)

  it 'can sort an array of selectors', ->
    scouter = new Scouter()
    selectors = ['.header h1', 'h1', '.header', '.header h1 > em']
    sortedSelectors = ['.header h1 > em', '.header h1', '.header', 'h1']
    expect(scouter.sort(selectors)).toEqual(sortedSelectors)