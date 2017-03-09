module RobotSim
  module Commands
    class Size < RobotSim::Command

      def execute
        size = @input.split(' ').last.to_i
        @controller.station = Station.new(size)
      end

      def self.matches?(input)
        input.split(' ').first == 'size'
      end

    end
  end
end