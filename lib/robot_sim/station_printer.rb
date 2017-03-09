module RobotSim
  class StationPrinter

    def self.print(station)
      index = 1
      station.each_slot do |slot|
        puts "#{index}: #{'X' * slot}"
        index += 1
      end
    end
  end
end