require 'rails_helper'

RSpec.describe "the Garden shoow page" do
  before(:each) do
    @garden1 = Garden.create!(name: "Arvada Community Garden", organic: true)


    @plot1 = @garden1.plots.create!(number: 13, size: "Medium", direction: "East")
    @plot2 = @garden1.plots.create!(number: 30, size: "Large", direction: "South")

    @plant1 = @plot1.plants.create!(name: "Tomato", description: "Likes sunlight", days_to_harvest: 45)
    @plant2 = @plot1.plants.create!(name: "Beans", description: "Needs trellace", days_to_harvest: 30)
    @plant3 = @plot2.plants.create!(name: "Corn", description: "Plant in rows", days_to_harvest: 125)
    @plant4 = @plot2.plants.create!(name: "Beans", description: "Needs trellace", days_to_harvest: 30)

    visit "/gardens/#{@garden1.id}"
  end

  it 'shows list of plants by plot that are less than 100 days to harvest' do

    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to_not have_content(@plant3.name)
    expect(page).to_not have_content(@plant4)
  end

end
