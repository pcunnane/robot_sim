module RobotSim
  module Commands
    class Move < RobotSim::Command

      ##
      # Move a box from one slot to another.
      # Raises an exception if the first slot is empty.

      def execute
        _, first, second, *rest = @input.split(' ').map(&:to_i)
        validate_slots!(first, second)

        if @controller.station.at(first) > 0
          @controller.station.decrement(first)
          @controller.station.increment(second)
        else
          raise RobotSim::Controller::InvalidCommandException.new("Cannot move from slot #{first}")
        end
      end

      def self.matches?(input)
        input.split(' ').first == 'mv'
      end  
    end
  end
end