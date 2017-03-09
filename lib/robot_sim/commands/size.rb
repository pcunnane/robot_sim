module RobotSim
  module Commands
    class Size < RobotSim::Command

      def execute
        size = @input.split(' ')[1].to_i
        if @controller.station
          @controller.station.resize(size)
        else
          @controller.station = Station.new(size)
        end
      end

      def self.matches?(input)
        input.split(' ').first == 'size'
      end

    end
  end
end