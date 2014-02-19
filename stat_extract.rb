#!/usr/bin/env ruby

require 'csv'
require 'date'

def parse_csv(filename)
  CSV.parse(File.read(filename), headers: true).map do |row|
    data = {}

    row.to_h.each do |key, value|
      next if key.nil? || value.nil?
      new_key = key.downcase.gsub(" ", "_").to_sym
      new_key = :license if new_key == :os_license

      value = value.upcase if new_key == :researcher
      value = Date.strptime(value, '%m/%d/%Y') if [:initial_release, :last_active_data].include?(new_key)

      data[new_key] = value
    end

    data
  end
end

def breakdown_by_language(data)
  languages = Hash.new(0)

  data.each do |tool|
    next if tool[:language].nil?

    tool[:language].split(",").each do |lang|
      languages[lang.strip] += 1
    end
  end

  languages
end

def breakdown_by_license(data)
  licenses = Hash.new(0)

  data.each do |tool|
    licenses[tool[:license]] += 1
  end

  licenses
end

data = parse_csv('data/tool_list_research.csv')
#puts breakdown_by_license(data).inspect
puts breakdown_by_language(data).inspect
#puts data.inspect

