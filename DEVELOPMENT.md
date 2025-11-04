# Development handbook

- run all tests: `bundle exec rake`
- auto-fix all fixable issues: `bundle exec fix`
- update dependencies: `bundle update`

## Release a new version to RubyGems

- in a branch:
  - update CHANGELOG.md
  - search and replace all occurrences of `1.1.0`
  - run `bundle install`
  - ship this branch
- push a new version to Rubygems: `rake release`
