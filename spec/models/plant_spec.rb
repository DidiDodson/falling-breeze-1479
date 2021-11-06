require "rails_helper"

RSpec.describe Plant, type: :model do
  describe "relationships" do
    it { should have_many :plot_plants }
    it { should have_many(:plots).through(:plot_plants) }
  end

  describe 'model methods' do
    it 'shows uniq plants under 100 days to harvest' do
      @garden1 = Garden.create!(name: "Arvada Community Garden", organic: true)

      @plot1 = @garden1.plots.create!(number: 13, size: "Medium", direction: "East")
      @plot2 = @garden1.plots.create!(number: 30, size: "Large", direction: "South")

      @plant1 = @plot1.plants.create!(name: "Tomato", description: "Likes sunlight", days_to_harvest: 45)
      @plant2 = @plot1.plants.create!(name: "Beans", description: "Needs trellace", days_to_harvest: 30)
      @plant3 = @plot2.plants.create!(name: "Corn", description: "Plant in rows", days_to_harvest: 125)
      @plant4 = @plot2.plants.create!(name: "Beans", description: "Needs trellace", days_to_harvest: 30)


      expect(@plot1.plants.under_100).to eq([@plant1, @plant2])
      expect(@plot2.plants.under_100).to eq([@plant4])
    end
  end
end
