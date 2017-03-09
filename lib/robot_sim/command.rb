module RobotSim
  class Command

    def initialize(input, controller)
      @input = input
      @controller = controller
    end

    def self.matches?(input)
      false
    end

    def execute
      raise NotImplementedError.new
    end

    private

    def validate_slots!(*list)
      list.each do |slot|
        unless @controller.station.slot_exists?(slot)
          raise RobotSim::Controller::InvalidCommandException.new("Unknown slot #{slot}")
        end
      end
    end  
  end
end