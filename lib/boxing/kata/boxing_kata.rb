require "boxing/kata/version"
require "boxing/kata/family"
require "boxing/kata/box"
require "boxing/kata/graphics"
require 'csv'
require 'gosu'
require 'date'

module Boxing
  module Kata

    def self.report
      unless has_input_file?
        puts "Usage: ruby ./bin/boxing-kata <spec/fixtures/family_preferences.csv"
      end
      
      # if we have an input file, we read in the CSV and store it in a CSV::Table object
      table = CSV.parse(STDIN, headers: true)
      brushes = Hash.new
      date = Date.new

      table.each do |row|
        if row['contract_effective_date']
          date = Date.parse(row['contract_effective_date'])
        end

        if brushes.has_key?("#{row['brush_color']}")
          brushes["#{row['brush_color']}"] += 1
        else
          brushes["#{row['brush_color']}"] = 1
        end
      end
    end

    def self.has_input_file?
      !STDIN.tty?
    end
  end
end