#!/usr/bin/env ruby
# coding: utf-8
##
## Copyright (C) 2015 Y.Morikawa <http://moya-notes.blogspot.jp/>
##
## License: MIT License  (See LICENSE.md)
##
## Original: http://ylgbk.hatenablog.com/entry/2015/05/05/120000
##
########################################
## Settings
########################################
DIR_FORMAT  = "%F"   # %F = %Y-%m-%d   (* Format of Time#strftime is available)

########################################
## Main
########################################

require 'fileutils'
require 'exifr'

class Dir
  def relocate!
    self.each do |file|
      # Exclude this script, directories, dot files
      if File.absolute_path(file) != File.absolute_path(__FILE__) and
        !( File.directory?(file) ) and
        file !~ /^\./

        # EXIF information is inquired by exifr library
        begin
          exif = EXIFR::JPEG.new(file)
        rescue
          warn "#{file}: EXIF data not found. Skipped."
          next
        end

        if !( exif.date_time )
          warn "#{file}: Date/Time data not found. Skipped."
          next
        end

        # Create the destination directory
        dst_dir = exif.date_time.strftime(DIR_FORMAT)
        FileUtils.mkdir_p dst_dir, {:verbose => false}
        
        # Move photos
        dst_path = File.join(dst_dir, file)
        FileUtils.move file, dst_path, {:verbose => true}
      end
    end
  end
end

Dir.new(Dir.pwd).relocate!.close
