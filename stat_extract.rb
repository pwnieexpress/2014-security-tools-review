#!/usr/bin/env ruby

require 'csv'

row_hashes = CSV.parse(File.read('data/tool_list_research.csv'), headers: true).each_entry.map(&:to_h)
