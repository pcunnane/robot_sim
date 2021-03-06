module RobotSim
  module Commands
    class Replay < RobotSim::Command

      ##
      # Replay the last n commands.
      # I wasn't quite sure what to have replay do. 
      # At first I thought it was a redo command, but you would have called it redo, right?
      # Here, I have it printing the last n commands. Sort of like the bash 'history' command.
      # If I had more time I'd print each version of the station (slots/boxes) for each command.
      
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
        command_name(input) == 'replay'
      end

    end
  end
end