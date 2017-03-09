module RobotSim
  class CommandFactory

    COMMANDS = [
      RobotSim::Commands::Size
    ]

    def self.build(input, controller)
      COMMANDS.each do |klass|
        return klass.new(input, controller) if klass.matches?(input)
      end

      nil
    end
  end
end