module RobotSim
  class CommandFactory

    COMMANDS = [
      RobotSim::Commands::Size,
      RobotSim::Commands::Add,
      RobotSim::Commands::Remove,
      RobotSim::Commands::Move,
      RobotSim::Commands::Undo,
    ]

    def self.build(input, controller)
      COMMANDS.each do |klass|
        return klass.new(input, controller) if klass.matches?(input)
      end

      nil
    end
  end
end