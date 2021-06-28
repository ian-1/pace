require_relative '../../config/api_keys'

class MeetupsController < ApplicationController
  before_action :set_meetup, only: %i[ show edit update destroy ]

  # GET /meetups or /meetups.json
  def index
    @meetups = Meetup.all
    @meetup = Meetup.new
    @api_key = ENV.fetch('GOOGLE_MAPS_API_KEY')
    # puts 'HERE', @api_key, 'HERE'
  end

  # GET /meetups/1 or /meetups/1.json
  def show
    @api_key = ENV.fetch('GOOGLE_MAPS_API_KEY')
    @current_meetup = Meetup.find(params[:id])
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
  end

  # GET /meetups/1/edit
  def edit
  end

  # POST /meetups or /meetups.json
  def create
    @meetup = Meetup.new(meetup_params)

    respond_to do |format|
      if @meetup.save
        # this should take us to conversations.
        # format.html { redirect_to @meetup, notice: "Meetup was successfully created." }
        # instead of showing the meetup, we want to share it!
        format.html { redirect_to conversations_path(@meetup), notice: "Meetup was successfully created. Please click on a conversation to share your meetup." }
        format.json { render :show, status: :created, location: @meetup }
        # p @meetup, '< MEETUP'
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetups/1 or /meetups/1.json
  def update
    respond_to do |format|
      if @meetup.update(meetup_params)
        format.html { redirect_to @meetup, notice: "Meetup was successfully updated." }
        format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetups/1 or /meetups/1.json
  def destroy
    @meetup.destroy
    respond_to do |format|
      format.html { redirect_to meetups_url, notice: "Meetup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meetup_params
      params.require(:meetup).permit(:name, :latitude, :longitude)
    end
end
