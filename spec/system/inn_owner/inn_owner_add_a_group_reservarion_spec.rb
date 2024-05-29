require 'rails_helper'

describe "Inn owner manage make a group reservarion" do


  it 'sucessfully' do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',
                                 document: '53783222001', email: 'joao@email.com',
                                 password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199',
                                description: 'Um bom lugar',
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM',
                                                      postal_code: '69067-080', neighborhood: 'Centro'})

    quarto1 = inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 6)
    quarto2 = inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)

    visit root_path
    click_on "Gestão de Pousadas"
    click_on "Fazer Reserva de Grupo"
    fill_in "name", with: "reserva grupo 1"
    fill_in "quantidade de hospedes", with: 5
    fill_in "data_inicio", with: Date.today+1
    fill_in "data_termino", with: Date.today+10
    select quarto1 from quartos
    fill_in "5"
    click_on "reservar"

    expect(current_page).to eq(group_reservation_index_path)
    expect(page).to have_content("Fazer Reserva de Grupo")
    expect(page).to have_content("data_inicio")
    expect(page).to have_content("data_termino")
    expect(page).to have_content("quartos relacionados: quarto1")


  end

end