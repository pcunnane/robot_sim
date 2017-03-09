module RobotSim
  module Commands
    class Add < RobotSim::Command

      def execute
        position = @input.split(' ').last.to_i
        @controller.station.increment(position)
      end

      def self.matches?(input)
        input.split(' ').first == 'add'
      end

    end
  end
end