module Boxing
  module Kata
    class Box

      #----------------------------------------------------#
      # Box Class: a new box object for each box that needs
      # created for the family.
      #
      # Has instance variables: brushCount, boxContents,
      # boxSize, and weight 
      #----------------------------------------------------#

      attr_reader(
        :boxContents,
        :brushCount,
        :weight
      )

      def initialize(boxSize)
        @brushCount = 0
        @boxContents = Hash.new #used to keep track of each item in the box
        @boxSize = boxSize # determines if starter box or refill box
        @weight = 0

        if @boxSize == 2
          @boxType = "Starter"
        else
          @boxType = "Refill"
        end
      end

      def add(brushColor)
        # adds a brush color to the box hash
        if @boxContents.has_key?(brushColor)
          @boxContents[brushColor] += 1
        else
          @boxContents[brushColor] = 1
        end
        @brushCount +=1
      end

      def full?
        @brushCount == @boxSize
      end

      def notEmpty?
        @brushCount != 0
      end

      def calcShipping
        # 16oz is the min weight a box can have to be priority
        if @weight > 16
          return "Shipping: Priority"
        else
          return "Shipping: First"
        end
      end


      def calcWeight(value)
        # weight is determined as:
        # brush - 9oz
        # replacement head - 1oz
        # paste kit - 7.6oz

        if @boxType == "Starter"
          @weight += (value * 17.6)
        else
          @weight += (value * 8.6)
        end
      end

      def calcFillDate(contractDate)
        print "Schedule: "
        if @boxType == "Starter"
          print contractDate
        else
          # refill dates happen every 90 days from the contract start date
          print (contractDate + 90).to_s + ", " + (contractDate + 180).to_s + ", " + (contractDate + 270).to_s + ", " + (contractDate + 360).to_s
        end
      end

      def output(contractDate)
        # outputs the box contents, priorty, and
        # schedule. Makes calls to caclWeight,
        # caclFilldate, and calcShipping to get
        # correct values

        if @boxType == "Starter"
          puts "STARTER BOX"
          @boxContents.each do |key, value|  
            puts "#{value} #{key} brushes"
            puts "#{value} #{key} replacement heads"
            calcWeight(value)
          end
        else
          puts "REFILL BOX"
          @boxContents.each do |key, value|  
            puts "#{value} #{key} replacement heads"
            calcWeight(value)
          end
        end
        puts @brushCount.to_s + " paste kits"
        puts calcFillDate(contractDate)
        puts calcShipping()
        puts "\n"
      end
    end
  end
end
