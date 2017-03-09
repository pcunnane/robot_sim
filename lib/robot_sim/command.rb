module RobotSim
  class Command

    def initialize(input, controller)
      @input = input
      @controller = controller
    end

    def self.matches?(input)
      false
    end
  end
end