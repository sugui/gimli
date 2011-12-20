# encoding: utf-8

require 'gimli/version'
require 'gimli/setup'
require 'gimli/markupfile'
require 'gimli/converter'
require 'gimli/albino'
require 'gimli/path'

module Gimli

  # Starts the processing of selected files
  def self.process!(file, recursive = false, merge = false, page_width = 0, page_height = 0, pagenumbers = false, remove_front_matter = false, output_filename = nil, output_dir = nil, stylesheet = nil)

    @files = Path.list_valid(file, recursive).map { |file| MarkupFile.new(file) }

    Converter.new(@files, merge, page_width, page_height, pagenumbers, remove_front_matter, output_filename, output_dir, stylesheet).convert!    
  end
end
