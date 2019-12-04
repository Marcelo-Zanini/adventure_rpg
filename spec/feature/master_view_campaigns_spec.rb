require 'rails_helper'

feature 'Master view campaigns' do
  scenario 'and must be a master' do
    #arranje
    player = create(:player)
    #act
    login_as(player, scope: :player)
    visit root_path
    #assert
    expect(page).not_to have_link('Minhas Campanhas')
  end

  scenario 'and must be a master to access path' do
    #arranje
    player = create(:player)
    #act
    login_as(player, scope: :player)
    visit campaigns_path
    #assert
    expect(current_path).to eq root_path
    expect(page).not_to have_link('Minhas Campanhas')
    expect(page).not_to have_content('Suas Campanhas')
  end

  scenario 'successfully' do
    #arranje
    master = create(:master)
    campaign1 = create(:campaign, player: master, name:'Campanha 1')
    campaign2 = create(:campaign, player: master, name:'Campanha 2')
    #act
    login_as(master, scope: :player)
    visit root_path
    click_on 'Minhas Campanhas'
    #assert
    expect(page).to have_css('h3', text:'Suas Campanhas')
    expect(page).to have_css('li', text:'Campanha 1')
    expect(page).to have_css('li', text:'Campanha 2')
  end
  
  scenario 'and is warned when no campaigns' do
    #arranje
    master = create(:master)
    #act
    login_as(master, scope: :player)
    visit root_path
    click_on 'Minhas Campanhas'
    #assert
    expect(page).to have_css('h3', text:'Suas Campanhas')
    expect(page).to have_css('h5', text:'Você ainda não possui nenhuma campanha')
  end
end
