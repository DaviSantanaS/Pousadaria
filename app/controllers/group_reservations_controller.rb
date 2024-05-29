class GroupReservationsController < ApplicationController
  def index
    @group_reservations = GroupReservation.all
  end

  def create

  end
end