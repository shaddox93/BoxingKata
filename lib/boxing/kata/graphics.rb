require 'gosu'

module Boxing
  module Kata
    class BoxWindow < Gosu::Window

      #----------------------------------------------------#
      # BoxWindow Class: creates a Gosu gui for the user to
      # interact with to generate the boxes. Required for
      # req: manager clicks a button
      #
      # Has instance variables: famTest, button_font,
      # beam_image, and header_font
      #----------------------------------------------------#

      def initialize(famData)

        super 640, 480, false
        self.caption = "Beam Shipping Manager Tool"

        @famData = famData # used to access family class
        @button_font = Gosu::Font.new(18, name:"Roboto")
        @beam_image = Gosu::Image.new("img/ext.jpg")
        @header_font = Gosu::Font.new(25, name:"Roboto")
      end

      def draw
        # drawing initial white background
        draw_rect(0, 0, 640, 480, Gosu::Color.new(0xffffffff))

        # drawing additional window items
        @beam_image.draw(0, 350, 1, 0.3, 0.3)
        @header_font.draw_text("Beam Shipping Manager will output data to the console", 50, 150, 1, 1.0, 1.0, Gosu::Color.new(0xff555555))
        @button_font.draw_text("Press ESC to Exit", 500, 450, 1, 1.0, 1.0, Gosu::Color.new(0xff555555))

        # drawing buttons
        draw_rect(130, 250, 180, 50, Gosu::Color.new(0xff555555))
        @button_font.draw_text("Generate Starter Box", 142, 265, 1, 1.0, 1.0, Gosu::Color::WHITE)
        draw_rect(340, 250, 180, 50, Gosu::Color.new(0xff555555))
        @button_font.draw_text("Generate Refill Box", 358, 265, 1, 1.0, 1.0, Gosu::Color::WHITE)
      end

      def needs_cursor?
        true
      end

      def button_down(id)
        if id == Gosu::KbEscape
          close
        elsif id == Gosu::MsLeft
          # if we have clicked the generate starter box button
          if (mouse_x >= 130 && mouse_x <= 310) && (mouse_y >=250 && mouse_y <= 300)
            @famData.fill_order("start")
          # if we have clicked the generate refill box button
          elsif (mouse_x >= 340 && mouse_x <= 520) && (mouse_y >=250 && mouse_y <= 300)
            @famData.fill_order("refill")
          end
        end
      end
    end
  end
end