require 'rails_helper'

feature 'player logs in' do
  scenario 'acessing login page' do
    #act
    visit root_path
    click_on 'Login'
    #assert
    expect(current_path).to eq new_player_session_path
  end

  scenario 'successfully' do
    #arramge
    user = Player.create(name: 'Fulano', email: 'fulado_de_tal@gmail.com', password: 'fu14n0', master: false )
    #act
    visit new_player_session_path
    within('main') do
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: 'fu14n0'
      click_on 'Log in'

    end
    #assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Bem Vindo Jogador Fulano')
  end

  scenario 'and must exist' do
    #arramge
    user = Player.create(name: 'Fulano', email: 'fulado_de_tal@gmail.com', password: 'fu14n0', master: false )
    #act
    visit new_player_session_path
    within('main') do
      fill_in 'Email', with: 'maluco_do_pedaco@gmail.com'
      fill_in 'Senha', with: 'M41uC0'
      click_on 'Log in'
    end
    #assert
    expect(current_path).to eq new_player_session_path
    expect(page).not_to have_content('Bem Vindo Jogador Fulano')
    expect(page).to have_content('Email ou senha inválida.')
  end

  scenario 'and must not be blank' do
    #arramge
    user = Player.create(name: 'Fulano', email: 'fulado_de_tal@gmail.com', password: 'fu14n0', master: false )
    #act
    visit new_player_session_path
    within('main') do
      fill_in 'Email', with: ''
      fill_in 'Senha', with: ''
      click_on 'Log in'
    end
    #assert
    expect(current_path).to eq new_player_session_path
    expect(page).not_to have_content('Bem Vindo Jogador Fulano')
    expect(page).to have_content('Email ou senha inválida.')
  end

  scenario 'and is recognized as a master' do
    #arramge
    user = Player.create(name: 'Maluco', email: 'maluco_do_pedaco@gmail.com', password: 'M41uC0', master: true )
    #act
    visit new_player_session_path
    within('main') do
      fill_in 'Email', with: 'maluco_do_pedaco@gmail.com'
      fill_in 'Senha', with: 'M41uC0'
      click_on 'Log in'
    end
    #assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Bem Vindo Mestre Maluco')
    expect(page).not_to have_content('Bem Vindo Jogador Maluco')
  end
end
