# pony-bio

Bioinformatics for the Pony ecosystem.

## Status

[![CircleCI](https://circleci.com/gh/rhagenson/pony-bio.svg?style=svg)](https://circleci.com/gh/rhagenson/pony-bio)

pony-bio is pre-alpha software.

## Installation

* Install [pony-stable](https://github.com/ponylang/pony-stable)
* Update your `bundle.json`

```json
{
  "type": "github",
  "repo": "rhagenson/pony-bio"
}
```

* `stable fetch` to fetch your dependencies
* `use "bio"` to include this package
* `stable env ponyc` to compile your application
