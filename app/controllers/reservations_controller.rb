class ReservationsController < ApplicationController
  before_action :require_user!
  before_action :set_reservation

  # GET /reservation
  def show
  end

  # GET /reservation/new
  def new
    @reservation ||= Reservation.new
  end

  # GET /reservation/edit
  def edit
  end

  # POST /reservation
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to @reservation, notice: "Reservation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservation
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: "Reservation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = current_user.reservation
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :first_name, :last_name, :guests_adults, :guests_children)
    end
end
