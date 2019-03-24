module Boxing
  module Kata
    class Box
      def initialize(boxSize)
        @brushCount = 0
        @boxContents = Hash.new
        @boxSize = boxSize
        @weight = 0

        if @boxSize == 2
          @boxType = "Starter"
        else
          @boxType = "Refill"
        end
      end

      def add(brushColor)

      end

      def full?
        @brushCount == @boxSize
      end

      def notEmpty?
        @brushCount != 0
      end

      def calcShipping

      end

      def calcWeight(value)

      end

      def calcFillDate(contractDate)

      end

      def output(contractDate)

      end
    end
  end
end
