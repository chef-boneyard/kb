# jr

[![Build Status](https://secure.travis-ci.org/jamie-ci/jr.png)](https://travis-ci.org/jamie-ci/jr)

The Jamie Runner (jr) is a test setup and execution framework designed to
work on remote nodes whose system dependencies cannot be relied upon, except
for an Omnibus installation of Chef. It uses a plugin architecture to add
support for different testing strategies such minitest, cucumber, bash, etc.

## Standalone Installation

To install jr without Jamie in a standalone environment, download and run its
installer:

```sh
/opt/chef/embedded/bin/ruby -e "$(curl -fsSkL raw.github.com/jamie-ci/jr/go)"
```
