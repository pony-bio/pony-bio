# pony-bio

Bioinformatics for the Pony ecosystem.

## Status

[![CircleCI](https://circleci.com/gh/pony-bio/pony-bio.svg?style=svg)](https://circleci.com/gh/pony-bio/pony-bio)

pony-bio is pre-alpha software.

## Installation

* Install [pony-stable](https://github.com/ponylang/pony-stable)
* Update your `bundle.json`

```json
{
  "type": "github",
  "repo": "pony-bio/pony-bio"
}
```

* `stable fetch` to fetch your dependencies
* `use "bio"` to include this package
* `stable env ponyc` to compile your application
