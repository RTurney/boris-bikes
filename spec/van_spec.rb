require 'Van'
require 'DockingStation'
describe Van do
  let(:garage) {double :garage, :storage => Array.new}
  let(:bike) {double :bike}
  context "storage" do

    it "should respond to storage" do
      expect(subject).to respond_to(:storage)
    end

    it "should return an array when called" do
      expect(subject.storage).to be_a(Array)
    end
  end

  context "deliver bikes function" do

    it {is_expected.to respond_to :deliver_bikes}

    it "should deliver bikes to the garage object" do
      subject.storage << bike 
      subject.deliver_bikes(garage)
      expect(subject.storage).not_to include(bike)
    end
  end

  context "collect bikes function" do

    it {is_expected.to respond_to :collect_bikes}

    it "should take bikes from the garage" do
      garage.storage << bike
      subject.collect_bikes(garage)
      expect(garage.storage).not_to include(bike)
    end
  end
end
