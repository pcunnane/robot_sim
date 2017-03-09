module RobotSim
  module Commands
    class Replay < RobotSim::Command

      ##
      # Replay the last n commands.
      # I wasn't quite sure what to have replay do. 
      # At first I thought it was a redo command, but you would have called it redo, right?
      # Here, I have it printing the last n commands. Sort of like the bash 'history' command.

      def execute
        amount = @input.split(' ')[1].to_i

        # Pop ourselves off the command history.
        _ = @controller.command_history.pop
        commands = @controller.command_history.last(amount)
        commands.each do |command|
          puts command.input
        end
      end

      def self.matches?(input)
        input.split(' ').first == 'replay'
      end

    end
  end
end