require "boxing/kata/version"
require "boxing/kata/family"
require "boxing/kata/box"
require "boxing/kata/graphics"
require 'gosu'
require 'csv'
require 'date'

module Boxing
  module Kata

    def self.report
      unless has_input_file?
        return puts "Usage: ruby ./bin/boxing-kata <spec/fixtures/family_preferences.csv"
      end
      
      # if we have an input file, we read in the CSV and store it in a CSV::Table object
      table = CSV.parse(STDIN, headers: true)
      brushes = Hash.new
      date = Date.new
      
      # reading through the table and getting the important dat that we need
      # we need to keep track of the color and number of brushes
      # and our contract start date
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

      # outputing the initial brush color/count
      if !brushes.empty?
        puts "BRUSH PREFERENCES"
        brushes.each do |key, value|  
          puts "#{key}: #{value}"
        end
        puts "\n\n"
      end

      famData = Family.new(brushes, date) # creating a new family class
      window = BoxWindow.new(famData) # creating a new boxwindow class
      window.show
      
    end

    def self.has_input_file?
      !STDIN.tty?
    end
  end
end