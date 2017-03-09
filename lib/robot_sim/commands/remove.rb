module RobotSim
  module Commands
    class Remove < RobotSim::Command

      def execute
        position = @input.split(' ').last.to_i
        @controller.station.decrement(position)
      end

      def self.matches?(input)
        input.split(' ').first == 'rm'
      end

    end
  end
end