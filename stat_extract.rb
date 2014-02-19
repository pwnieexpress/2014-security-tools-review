#!/usr/bin/env ruby

require 'csv'
require 'date'

def parse_csv(filename)
  parsed_csv = CSV.parse(File.read(filename), headers: true)
  data = parsed_csv.map do |row|
    data = {}

    row.to_h.each do |key, value|
      next if key.nil? || value.nil?
      new_key = key.downcase.gsub(" ", "_").to_sym

      puts "Key: #{new_key}, Value: #{value.gsub("\n", " ")}"
      value = Date.strptime(value, '%m/%d/%Y') if [:initial_release, :last_active_data].include?(new_key)

      data[new_key] = value
    end

    data
  end
rescue => e
  puts "Exception #{e.message}"
end


puts parse_csv('data/tool_list_research.csv')
