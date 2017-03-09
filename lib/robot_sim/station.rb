module RobotSim
  class Station

    ##
    # This is the model responsible for slots and boxes.

    attr_reader :size

    def initialize(size)
      @size = size

      # Initialize slots filled with zeroes.
      @slots = Array.new(@size).map { 0 }
    end

    def at(position)
      @slots[position_to_index(position)]
    end

    def increment(position)
      @slots[position_to_index(position)] += 1
    end

    ##
    # Only expose slots via an interator.
    
    def each_slot(&blk)
      @slots.each do |slot|
        blk.call(slot)
      end
    end

    private
    ##
    # Use 1 based everywhere except when accessing slots.

    def position_to_index(position)
      position - 1
    end
  end
end