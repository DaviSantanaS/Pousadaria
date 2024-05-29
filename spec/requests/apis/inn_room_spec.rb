require 'rails_helper'

RSpec.describe "inn room api" do
  context 'get /api/v1/inn_room' do
    it 'successfuly' do
      # ter um quarto
      inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',
                                   document: '53783222001', email: 'joao@email.com',
                                   password: '123456')
      inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199',
                                  description: 'Um bom lugar',
                                  address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM',
                                                        postal_code: '69067-080', neighborhood: 'Centro'})

      quarto1 = inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
      inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)


      # requisitar o quarto id 5
      get api_v1_inn_room_path(quarto1.id)
      json_response = JSON.parse(response.body)

      # verificar
      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      expect(json_response['name']).to eq("Quarto com Varanda")
      expect(json_response['name']).not_to eq("Quarto Térreo")
      expect(json_response['size']).to eq(35)
      expect(json_response['guest_limit']).to eq(3)
      expect(json_response['daily_rate_cents']).to eq(nil)

    end

  end
end