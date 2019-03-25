module Boxing
  module Kata
    class Family

      attr_reader(
        :brushes,
        :contractDate
      )

      def initialize(brushes, contractDate)
        @brushes = brushes
        @contractDate = contractDate
        @startBoxFlag = 1
      end

      def fill_order(buttonClickType)
        # Fills the order of the box
        # Takes one param - a button click type
        # Depending on the button click type, the method will
        # fill and output the correct box
        boxSize = 0
        if buttonClickType == "start"
          if @brushes.empty?
            return puts "enter family data"
          end
          boxSize = 2
          @startBoxFlag = 1
        else
          if @startBoxFlag != 1 #if we haven't created a starter box yet
            return puts "please generate a starter box first"
          end
          boxSize = 4
        end
          
        box = Box.new(boxSize) #create the first box object
        
        # iterates through our family's brushes hash and
        # adds each brush to the box. We check to see if
        # our box is full and if it is, we create a new
        # box object.

        @brushes.each do |key, value|  
          x = "#{value}".to_i
          while x > 0 do
            box.add("#{key}")
            if box.full?
              box.output(@contractDate)
              box = Box.new(boxSize)
            end
            x -=1
          end
        end
        if box.notEmpty?
          box.output(@contractDate) #outputs all box data
        end
      end
    end
  end
end

