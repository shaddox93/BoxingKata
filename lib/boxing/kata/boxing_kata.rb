require "boxing/kata/version"
require "boxing/kata/family"
require 'csv'
require 'gosu'

module Boxing
  module Kata

    def self.report
      unless has_input_file?
        puts "Usage: ruby ./bin/boxing-kata <spec/fixtures/family_preferences.csv"
      end
      
      # if we have an input file, we read in the CSV and store it in a CSV::Table object
      table = CSV.parse(STDIN, headers: true)
      brushes = Hash.new
      #contractStart = ''

      table.each do |row|
        #if row['contract_effective_date']

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

#class MyWindow < Gosu::Window
#  def initialize
#    super 640, 480
#    self.caption = 'Hello World!'
#  end
#end

#window = MyWindow.new
#window.show

