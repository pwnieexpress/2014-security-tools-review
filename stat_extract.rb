#!/usr/bin/env ruby

require 'csv'

parsed_csv = CSV.parse(File.read('data/tool_list_research.csv'), headers: true)
data = parsed_csv.map do |row|
  data = {}

  row.to_h.each do |key, value|
    next if key.nil? || value.nil?
    new_key = key.downcase.gsub(" ", "_").to_sym
    data[new_key] = value
  end

  data
end


puts data.inspect
