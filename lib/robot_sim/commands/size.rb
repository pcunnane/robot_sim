module RobotSim
  module Commands
    class Size < RobotSim::Command

      ##
      # Set the size of the station.
      # TODO: Fix undo for resizing. (out of time)
      # - Will require storing the previous version of the station and reloading it.

      def execute
        size = @input.split(' ')[1].to_i
        if @controller.station
          @controller.station.resize(size)
        else
          @controller.station = Station.new(size)
        end
      end

      def self.matches?(input)
        command_name(input) == 'size'
      end

    end
  end
end