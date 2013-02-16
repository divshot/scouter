# Scouter

**Scouter** is a CSS selector specificity utility written in CoffeeScript that adheres to the [W3C specification](http://www.w3.org/TR/selectors/#specificity).

## Usage

```javascript
var scouter = new Scouter();

// Calculate selector specificity scores
scouter.score('*'); // 0
scouter.score('LI'); // 1
scouter.score('UL LI'); // 2
scouter.score('UL OL+LI'); // 3
scouter.score('H1 + *[REL=up]'); // 11
scouter.score('UL OL LI.red'); // 13
scouter.score('LI.red.level'); // 21
scouter.score('#x34y'); // 100
scouter.score('#s12:not(F00)'); // 101

// Sort an array of selectors by score
var selectors = [
  '#scouter',
  '#scouter .is',
  '#scouter .is > p.retty',
  '#scouter .is > p.retty > n.ifty:first-child'
];

scouter.sort(selectors);
scouter.sort(selectors, 'desc'); // Most specific to least specific
scouter.sort(selectors, 'asc'); // Least specific to most specific
```

## License

Copyright (c) 2013 Divshot

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.