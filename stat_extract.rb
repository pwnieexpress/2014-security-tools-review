#!/usr/bin/env ruby

require 'csv'
require 'date'
require 'json'

# A way to pretty print-ish an object
def jp(object)
  puts JSON.generate(object)
  #puts JSON.pretty_generate(object)
  #puts object.inspect
rescue
  puts "Unabled to display #{object.class} classes"
end

def parse_csv(filename)
  CSV.parse(File.read(filename), headers: true).map do |row|
    data = {}

    row.to_hash.each do |key, value|
      next if key.nil? || value.nil?
      new_key = key.downcase.gsub(" ", "_").to_sym
      new_key = :license if new_key == :os_license

      value = value.upcase if new_key == :researcher
      value = Date.strptime(value, '%m/%d/%Y') if [:initial_release, :last_active_date].include?(new_key)

      data[new_key] = value
    end

    data
  end
end

def breakdown_by_language(data)
  languages = Hash.new(0)

  data.each do |tool|
    clean_lang = tool[:language] || "Missing"
    clean_lang.split(",").each do |lang|
      languages[lang.strip] += 1
    end
  end

  languages
end

def breakdown_by_svc(data)
  svc_hash = Hash.new(0)

  data.each do |tool|
    svc = tool[:version_control] || "Missing"
    svc_hash[svc] += 1
    puts svc
  end

  svc_hash
end

def breakdown_by_license(data)
  licenses = Hash.new(0)

  data.each do |tool|
    licenses[tool[:license] || "Missing"] += 1
  end

  licenses
end

def breakdown_by_start_year(data)
  years = Hash.new(0)

  data.each do |tool|
    next unless tool[:initial_release]
    years[tool[:initial_release].year] += 1
  end

  years
end

def language_by_year(data)
  years = {}

  data.each do |tool|
    next unless tool[:initial_release] && tool[:language]
    clean_lang = tool[:language] || "Missing"
    clean_lang.split(",").each do |lang|
      years[tool[:initial_release].year] ||= Hash.new(0)
      years[tool[:initial_release].year][lang.strip] += 1
    end
  end

  years
end

def license_by_year(data)
  years = {}

  data.each do |tool|
    next unless tool[:initial_release] && tool[:license]
    years[tool[:initial_release].year] ||= Hash.new(0)
    years[tool[:initial_release].year][tool[:license]] += 1
  end

  years
end

def length_of_project(data)
  length = []

  data.each do |tool|
    next unless tool[:initial_release] && tool[:last_active_date]
    length << (tool[:last_active_date] - tool[:initial_release]).to_i
  end

  length.sort
end

data = parse_csv('data/tool_list_research.csv')

length = length_of_project(data)
median = (length[(length.size - 1) / 2] + length[length.size / 2]) / 2

#jp breakdown_by_license(data)
#jp breakdown_by_language(data)
#jp breakdown_by_start_year(data)
#jp language_by_year(data)
#jp license_by_year(data)
#jp breakdown_by_svc(data)

#puts "Shortest Project Length (days): #{length.min}"
#puts "Average Project Length (days): #{length.inject(&:+) / length.size}"
#puts "Median Project Length (days): #{median}"
#puts "Longest Project Length (days): #{length.max}"

def csv_of_language_by_year(data)
  result = language_by_year(data)
  langs = result.map { |yr, langs| langs.map { |k, v| k }}.flatten.uniq
  rows = [['', langs].flatten] + result.map { |yr, ln| [yr, langs.map { |l| ln[l] || 0 }].flatten }
  rows.map { |r| r.join(",") }.join("\n")
end

def csv_of_license_by_year(data)
  result = license_by_year(data)
  langs = result.map { |yr, langs| langs.map { |k, v| k }}.flatten.uniq
  rows = [['', langs].flatten] + result.map { |yr, ln| [yr, langs.map { |l| ln[l] || 0 }].flatten }
  rows.map { |r| r.join(",") }.join("\n")
end

def csv_of_languages(data)
  res = breakdown_by_language(data)
  res.map{|l,c| [l,c].join(",")}.join("\n")
end

def csv_of_licenses(data)
  res = breakdown_by_license(data)
  res.map{|l,c| [l,c].join(",")}.join("\n")
end

def csv_of_svc(data)
  res = breakdown_by_svc(data)
  res.map{|l,c| [l,c].join(",")}.join("\n")
end

#puts csv_of_license_by_year(data)
#puts csv_of_language_by_year(data)
#puts csv_of_languages(data)
#puts csv_of_licenses(data)
#puts csv_of_svc(data)

puts data.inspect

