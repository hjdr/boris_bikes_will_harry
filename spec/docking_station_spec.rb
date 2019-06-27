require './lib/docking_station.rb'

describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  context "#initialize" do 
    context "with parameters" do 
      let(:dockingstation) {DockingStation.new(40)}

      it "should use specified values" do 
        expect(dockingstation.capacity).to eq(40)
      end 
    end
    context "without parameters" do 
      let(:dockingstation) {DockingStation.new}

      it "should use defaults" do 
        expect(dockingstation.capacity).to eq(20)
      end
    end
  end 

  describe '#release_bike' do
    subject(:station) do
      station = DockingStation.new
      station.receive_bike(Bike.new)
      station
    end

    it 'creates a Bike class when method is called' do
      expect(station.release_bike).to be_an_instance_of(Bike)
    end

    it 'releases working bikes' do
      expect(station.release_bike).to be_working
    end

    it "raises an Error if no Bikes available" do
      new_station = DockingStation.new
      expect { new_station.release_bike }.to raise_error "No Bikes Available"
    end
  end

  describe "#receive_bike" do
    it "responds to receive_bike" do
      expect(subject).to respond_to(:receive_bike).with(1).argument
    end
  end

  it "stores the user's bike" do
    boris_bike = Bike.new
    expect(subject.receive_bike(boris_bike)).to include(boris_bike)
  end

  it "raises an Error if the bike rack is full" do
    new_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times{new_station.receive_bike("bike")}
    expect { new_station.receive_bike("bike") }.to raise_error "Bike rack is full"
  end


  describe "@available_bikes" do
    it "lists all of the available bikes at the station" do
      station = DockingStation.new
      boris_bike = Bike.new
      station.receive_bike(boris_bike)
      expect(station.available_bikes).to eq([boris_bike])
    end
  end

   

end
