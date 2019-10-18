require 'rails_helper'

feature 'Visitor visit home page' do
  scenario 'successfully' do
    #act
    visit root_path
    #assert
    expect(page).to have_css('header')
    within('header') do
      expect(page).to have_css('h1', text: 'Adventure RPG')
    end
    expect(page).to have_css('nav')
    expect(page).to have_css('main')
    within('main') do
      expect(page).to have_css('h2', text: 'Bem Vindo ao nosso sistema de apoio a RPG')
    end
  end
end
