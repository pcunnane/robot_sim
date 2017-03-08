require "spec_helper"

RSpec.describe RobotSim::Controller do
  context 'size not given first' do
    it "raises the correct exception" do
      expect { subject.execute("anything except size") }.to raise_exception(RobotSim::Controller::SizeNotGivenException)
    end
  end
end