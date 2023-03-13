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
    if @reservation.optional_completed?
      render 'full'
    elsif @reservation.unstarted? || !@reservation.attending?
      render 'edit'
    elsif params[:optional]
      render 'optional'
    else
      render 'edit'
    end
  end

  # POST /reservation
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to optional_survey_path, notice: "Thanks #{@reservation.first_name}. We've saved your RSVP!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservation
  def update
    if @reservation.update(reservation_params)
      if @reservation.attending?
        if !@reservation.optional_completed?
          @reservation.staying_onsite = @reservation.accommodation_cabin?
          @reservation.meal_friday_dinner = @reservation.attending_friday?
          @reservation.meal_saturday_breakfast = @reservation.attending_saturday?
          @reservation.meal_saturday_lunch = @reservation.attending_saturday?
          @reservation.meal_saturday_dinner = @reservation.attending_saturday?
          @reservation.meal_saturday_snack = @reservation.attending_saturday?
          @reservation.meal_sunday_brunch = @reservation.attending_sunday?
          @reservation.save

          redirect_to optional_survey_path, notice: "Thanks #{@reservation.first_name}. We've saved your RSVP!"
        else
          redirect_to root_path, notice: "Thanks #{@reservation.first_name}, your RSVP is complete!"
        end
      else
        redirect_to root_path, notice: "Thanks for letting us know you won't be able to make it, #{@reservation.first_name}. Let us know before August 1st if anything changes."
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservation/preview
  def update_preview
    @reservation = current_user.reservation
    @reservation.assign_attributes(reservation_params.to_h)
    render 'update_preview'
  end

  # PATCH/PUT /reservation/optional/preview
  def update_optional_preview
    @reservation = current_user.reservation
    @reservation.assign_attributes(reservation_params.to_h)
    render 'update_optional_preview'
  end

  # PATCH/PUT /reservation/full/preview
  def update_full_preview
    @reservation = current_user.reservation
    @reservation.assign_attributes(reservation_params.to_h)
    render 'update_full_preview'
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
      params.require(:reservation).permit(:user_id, :first_name, :last_name, :guests_adults, :guests_children, :attending, :attending_friday, :attending_saturday, :attending_sunday, :staying_onsite, :accommodation_rv, :accommodation_tent, :accommodation_cabin, :accommodation_hotel, :cabin_number, :cabin_mate_request, :cabin_own_linens, :cabin_own_linens_description, :hotel_name, :designated_driver_plan, :food_allergies, :dietary_preferences, :additional_comments, :guest_names, :meal_friday_dinner, :meal_saturday_breakfast, :meal_saturday_lunch, :meal_saturday_dinner, :meal_saturday_snack, :meal_sunday_brunch, :optional_completed)
    end
end
