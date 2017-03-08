require "spec_helper"

RSpec.describe RobotSim::Controller do
  describe 'size' do
    context 'size not given first' do
      it "raises the correct exception" do
        expect { subject.execute("anything except size") }.to raise_exception(RobotSim::Controller::SizeNotGivenException)
      end
    end

    # context 'size given first' do
    #   before(:each) do
    #     subject.execute("size 3")
    #   end
    #   it "raises the correct exception" do
    #     expect { subject.execute("anything except size") }.to raise_exception(RobotSim::Controller::SizeNotGivenException)
    #   end
    # end
  end
end