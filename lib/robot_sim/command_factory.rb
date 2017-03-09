module RobotSim
  class CommandFactory

    # Would be nicer to dynamically load these out of the commands directory.
    
    COMMANDS = [
      RobotSim::Commands::Size,
      RobotSim::Commands::Add,
      RobotSim::Commands::Remove,
      RobotSim::Commands::Move,
      RobotSim::Commands::Undo,
      RobotSim::Commands::Replay
    ]

    def self.build(input, controller)
      COMMANDS.each do |klass|
        return klass.new(input, controller) if klass.matches?(input)
      end

      nil
    end
  end
end