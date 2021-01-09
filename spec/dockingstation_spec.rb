require "DockingStation"
describe DockingStation do

  let(:bike) {double :bike, :report_broken =>true, :working? => true }

  context "release bike function" do

    it {is_expected.to respond_to :release_bike}

    it "should return a bike if there is a bike" do
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it "should return an error if there is no bike" do
      expect{subject.release_bike}.to raise_error "There is no bike"
    end

    it "should not release a bike if broken" do
      bike.report_broken
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "This bike is broken and cannot be released"
    end

  end

  context "docks bike" do

    it "will dock a bike" do
      subject.dock(bike)
      expect(subject.bikes).to include bike
    end

    it "should return an error if the docking station is full" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock bike}
      bike2 = double(:bike)
      expect{subject.dock(bike2)}.to raise_error "This station is full"
    end

  end

  context "capacity" do

    it "should have a default capacity if no capacity is given" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  end

end
