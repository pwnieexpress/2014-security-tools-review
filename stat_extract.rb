#!/usr/bin/env ruby

require 'csv'
require 'date'

def parse_csv(filename)
  CSV.parse(File.read(filename), headers: true).map do |row|
    data = {}

    row.to_h.each do |key, value|
      next if key.nil? || value.nil?
      new_key = key.downcase.gsub(" ", "_").to_sym

      value = value.upcase if new_key == :researcher
      value = Date.strptime(value, '%m/%d/%Y') if [:initial_release, :last_active_data].include?(new_key)

      data[new_key] = value
    end

    data
  end
end

puts parse_csv('data/tool_list_research.csv').inspect

