# Photos Relocate Script with EXIF Information

## Overview

Relocate photo files in a current directory to Date/Time directories (ex. 2015-06-10/) with EXIF Information

## Installation

- Install [Ruby](https://www.ruby-lang.org/)
- Install [exifr library](https://github.com/remvee/exifr)
    - Add the library path to RUBYLIB
- Download **photo-relocate.rb**
    - Move the script to a directory included in PATH.
    - Add executable permission (ex. `chmod 755 photo-relocate.rb`)

## Usage

Move the directory where photos are located. Then execute photo-relocate.rb.

    $ photo-relocate.rb

## Original Script

- <http://ylgbk.hatenablog.com/entry/2015/05/05/120000>

## Test Environment

- ruby 2.2.2p95
- exifr 1.2.2
