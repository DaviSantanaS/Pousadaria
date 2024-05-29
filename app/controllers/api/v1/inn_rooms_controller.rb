class Api::V1::InnRoomsController < ActionController::API
  before_action :set_inn_room, only: [:show]

  def show
    render json: @InnRoom.as_json(only: [:name, :size, :guest_limit, :daily_rate_cents])
  end

  private

  def set_inn_room
    @InnRoom = InnRoom.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {error: "room not found"}, status: :not_found
  end

end