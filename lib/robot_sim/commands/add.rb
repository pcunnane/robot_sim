module RobotSim
  module Commands
    class Add < RobotSim::Command

      def execute
        @slot = @input.split(' ')[1].to_i
        validate_slots!(@slot)
        @controller.station.increment(@slot)
      end

      def undo
        @controller.station.decrement(@slot)
      end

      def self.matches?(input)
        input.split(' ').first == 'add'
      end

    end
  end
end