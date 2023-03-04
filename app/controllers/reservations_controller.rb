class ReservationsController < ApplicationController
  before_action :require_user!
  before_action :set_reservation, except: :update_preview

  layout 'reservation'

  # GET /reservation
  def show
    redirect_to edit_reservation_path
  end

  # GET /reservation/new
  def new
    @reservation ||= Reservation.new
    @reservation.user = current_user
    @reservation.save
  end

  # GET /reservation/edit
  def edit
    
  end

  # POST /reservation
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to root_path, notice: "Thanks #{@reservation.first_name}. We've updated your RSVP!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservation
  def update
    if @reservation.update(reservation_params)
      redirect_to root_path, notice: "Thanks #{@reservation.first_name}. We've updated your RSVP!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservation/preview
  def update_preview
    @focused = params[:focus]
    @reservation = current_user.reservation
    @reservation.assign_attributes(reservation_params.to_h)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      if current_user.reservation
        @reservation = current_user.reservation
      else
        @reservation ||= Reservation.new
        @reservation.user = current_user
        @reservation.save
      end
      @reservation
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :first_name, :last_name, :guests_adults, :guests_children, :attending, :attending_friday, :attending_saturday, :attending_sunday, :staying_onsite, :accommodation_rv, :acommodation_tent, :accommodation_cabin, :accommodation_hotel, :cabin_number, :cabin_mate_request, :cabin_own_linens, :hotel_name, :designated_driver_plan)
    end
end
