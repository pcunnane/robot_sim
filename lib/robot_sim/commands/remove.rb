module RobotSim
  module Commands
    class Remove < RobotSim::Command

      ##
      # Remove a box from the given slot.
      # Raises an exception if the given slot is empty.

      def execute
        @slot = @input.split(' ')[1].to_i
        validate_slots!(@slot)

        if @controller.station.at(@slot) > 0
          @controller.station.decrement(@slot)
        else
          raise RobotSim::Controller::InvalidCommandException.new("Cannot remove from slot #{first}")  
        end  
      end

      def undo
        @controller.station.increment(@slot)
      end

      def self.matches?(input)
        command_name(input) == 'rm'
      end

    end
  end
end