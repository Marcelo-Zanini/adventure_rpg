require 'rails_helper'

feature 'master view campaign' do
  scenario 'successfully' do
    #arrange
    master = create(:master)
    campaign1 = create(:campaign, player: master, name: 'Ataque dos aliens', players_number: 4)
    campaign2 = create(:campaign, player: master, name: 'Busca pela Nave espacial', players_number: 5)
    #act
    login_as(master, scope: :player)
    visit campaigns_path
    click_on 'Ataque dos aliens'
    #assert
    expect(current_path).to eq campaign_path(campaign1.id)
    expect(page).to have_css('h3', text: 'Ataque dos aliens')
    expect(page).to have_css('h4', text: "Número de Jogadores: #{campaign1.players_number}")
    expect(page).not_to have_content('Busca pela Nave espacial')
    expect(page).not_to have_content("Número de Jogadores: #{campaign2.players_number}")
    expect(page).to have_link("Minhas Campanhas")
  end

  scenario 'and return to campaigns list' do
    #arrange
    master = create(:master)
    campaign = create(:campaign, player: master)
    campaign2 = create(:campaign, player: master, name: 'Busca pela Nave espacial')
    #act
    login_as(master, scope: :player)
    visit campaigns_path
    click_on campaign.name
    click_on "Minhas Campanhas"
    #assert
    expect(current_path).to eq campaigns_path
    expect(page).to have_link('Busca pela Nave espacial')
  end

  scenario 'and must be a master' do
    #arrange
    player = create(:player)
    campaign1 = create(:campaign, player: player)
    #act
    login_as(player, scope: :player)
    visit campaign_path(campaign1)
    visit campaign_path(campaign1)
    #assert
    expect(current_path).to eq root_path
  end

  scenario 'and must be campaigns owner' do
    #arrange
    true_master = create(:master)
    fake_master = create(:master)
    campaign = create(:campaign, player: true_master)
    #act
    login_as(fake_master, scope: :player)
    visit campaign_path(campaign)

    expect(current_path).to eq root_path
  end
end
