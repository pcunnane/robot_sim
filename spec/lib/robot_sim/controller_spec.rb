require "spec_helper"

RSpec.describe RobotSim::Controller do
  describe 'size' do
    context 'size not given first' do
      it "raises the correct exception" do
        expect { subject.execute("anything except size") }.to raise_exception(RobotSim::Controller::SizeNotGivenException)
      end
    end

    context 'size given first' do
      it "has zero boxes in first slot" do
        expect(subject.execute("size 3").at(1)).to be(0)
      end
    end
  end

  describe 'add' do
    context 'size given first' do
      before(:each) do
        subject.execute("size 3")
      end
      it "increments the third slot" do
        expect(subject.execute("add 3").at(3)).to be(1)
      end
    end
  end


  describe 'rm' do
    context 'size given first' do
      before(:each) do
        subject.execute("size 3")
      end
      it "increments and decrements" do
        subject.execute("add 3")
        station = subject.execute("rm 3")
        expect(station.at(3)).to be(0)
      end
    end
  end

  describe 'mv' do
    context 'size given first' do
      before(:each) do
        subject.execute("size 3")
        subject.execute("add 3")
        subject.execute("add 3")
      end
      context 'valid slot' do
        it "increments and decrements" do
          station = subject.execute("mv 3 2")
          expect(station.at(2)).to be(1)
          expect(station.at(3)).to be(1)
        end
      end

      context 'invalid slot' do
        it 'raises an exception' do
          expect { subject.execute("mv 1 2") }.to raise_exception(RobotSim::Controller::InvalidCommandException)
        end
      end
    end
  end

end