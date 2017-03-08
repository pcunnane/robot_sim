module RobotSim
  class Controller

    class SizeNotGivenException < Exception; end

    def initialize
    end

    def execute(input)
      raise SizeNotGivenException.new
    end
  end
end