module RobotSim
  class Controller

    class SizeNotGivenException < Exception; end
    class UnknownCommandException < Exception; end

    attr_accessor :station

    def initialize
      @station = nil
    end

    def execute(input)
      command = CommandFactory.build(input, self)
      if !station && !command.is_a?(Commands::Size)
        raise SizeNotGivenException.new
      end

      raise UnknownCommandException.new unless command

      command.execute

      @station
    end
  end
end