module RobotSim
  module Commands
    class Undo < RobotSim::Command

      ##
      # Undo the last n commands,

      def execute
        amount = @input.split(' ')[1].to_i

        # Pop ourselves off the command history.
        _ = @controller.command_history.pop
        amount.times do
          command = @controller.command_history.pop
          command.undo
        end
      end

      def self.matches?(input)
        input.split(' ').first == 'undo'
      end

    end
  end
end