module RobotSim
  class Controller

    class SizeNotGivenException < Exception; end
    class UnknownCommandException < Exception; end
    class InvalidCommandException < Exception; end

    attr_accessor :station, :command_history

    def initialize
      @station = nil
      @command_history = []
    end

    def execute(input)
      command = CommandFactory.build(input, self)
      if !station && !command.is_a?(Commands::Size)
        raise SizeNotGivenException.new
      end

      raise UnknownCommandException.new unless command

      @command_history.push(command)

      begin
        command.execute
      rescue Exception => e

        # Don't record failed commands.
        @command_history.pop 
        raise e
      end
      
      @station
    end
  end
end