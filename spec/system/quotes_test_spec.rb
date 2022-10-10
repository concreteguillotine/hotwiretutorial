require "rails_helper"

RSpec.feature "Quotes" do
    quote = FactoryBot.create(:quote)

    before do
        visit quotes_path
    end

    scenario "users can create a quote" do
        within("h1") do
            expect(page).to have_content("Quotes")
        end

        click_link "New quote"
        within("h1") do
            expect(page).to have_content("New quote")
        end

        fill_in "Name", with: "Capybara quote"
        click_button "Create quote"

        within("h1") do
            expect(page).to have_content("Quotes")
        end
        expect(page).to have_content("Capybara quote")
    end

    scenario "showing quotes" do
        click_link quote.name
        within("h1") do
            expect(page).to have_content(quote.name)
        end
    end

    scenario "editing a quote" do
        within("h1") do
            expect(page).to have_content("Quotes")
        end

        click_link "Edit"
        within("h1") do
            expect(page).to have_content("Edit quote")
        end

        fill_in "Name", with: "Updated quote"
        click_button "Update quote"

        within("h1") do
            expect(page).to have_content("Quotes")
        end
        expect(page).to have_content("Updated quote")
    end

    scenario "deleting a quote" do
        expect(page).to have_content(quote.name)
        
        click_button "Delete"
        expect(page).not_to have_content(quote.name)
    end
end