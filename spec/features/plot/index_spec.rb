require 'rails_helper'

RSpec.describe "the Plots index page" do
  it "should display all plots by number and show associated plants" do
    garden = Garden.create!(name: "Arvada Community Garden", organic: true)

    plot1 = garden.plots.create!(number: 13, size: "Medium", direction: "East")
    plot2 = garden.plots.create!(number: 30, size: "Large", direction: "South")

    plant1 = plot1.plants.create!(name: "Tomato", description: "Likes sunlight", days_to_harvest: 45)
    plant2 = plot1.plants.create!(name: "Beans", description: "Needs trellace", days_to_harvest: 30)
    plant3 = plot2.plants.create!(name: "Corn", description: "Plant in rows", days_to_harvest: 60)

    visit plots_path

    expect(current_path).to eq('/plots')

    within("#plot-#{plot1.id}") do
      expect(page).to have_content("#{plot1.number}")
      expect(page).to have_content(plant1.name)
      expect(page).to have_content(plant2.name)
    end

    within("#plot-#{plot2.id}") do
      expect(page).to have_content("#{plot2.number}")
      expect(page).to have_content(plant3.name)
    end
  end
end
