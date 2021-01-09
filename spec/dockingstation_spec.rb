require "DockingStation"
describe DockingStation do

  context "release bike function" do

    it {is_expected.to respond_to :release_bike}

    it "should return a bike if there is a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it "should return an error if there is no bike" do
      expect{subject.release_bike}.to raise_error "There is no bike"
    end

  end

  context "docks bike" do

    it "will dock a bike" do
      bicycle = Bike.new
      subject.dock(bicycle)
      expect(subject.bikes).to include bicycle
    end

    it "should return an error if there is already a bike docked" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock Bike.new}
      bike2 = Bike.new
      expect{subject.dock(bike2)}.to raise_error "This station is full"
    end
  end

  context "capacity" do

    it "should have a default capacity if no capacity is given" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end 

  end

end
