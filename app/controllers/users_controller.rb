# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def index
    @users = User.all
    if !params[:q].nil? && params[:q].downcase == "male"
      @male_users = []
      @users.each do |user|
        @male_users << user if user.gender == "Male"
      end
      @users = @male_users
    elsif params[:q] && !params[:q].empty? 
      @users = @users.search(params[:q].downcase) 
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    @endorsements = Endorsement.all
    @endorsement = Endorsement.new
    @users = User.all
    @user = User.find(params[:id])

    @user_endorsements = push_user_endorsements(@endorsements, @user)
    @endorsement_counter = calculate_user_endorsements(@endorsements, @user)

    @reports = Report.all
    @reported = reported?(@reports, @user, current_user)
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def push_user_endorsements(endorsements, user)
    user_endorsements = []
    endorsements.each do |endorsement|
      user_endorsements << { user_id: endorsement.endorser_id, message: endorsement.body } if endorsement.user_id == user.id
    end
    user_endorsements
  end

  def calculate_user_endorsements(endorsements, user)
    counter = 0
    endorsements.each do |endorsement|
      counter+= 1 if endorsement.user_id == user.id
    end
    counter
  end

  def reported?(reports, reported_user, reporter_user)
    report_match = false
    reports.each do |report|
      report_match = true if report.user_id == reported_user.id && report.reporter_id == reporter_user.id
    end
    report_match
  end
end
