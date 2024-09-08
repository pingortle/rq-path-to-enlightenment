class ChallengesController < ApplicationController
  before_action :set_journey
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def index
    @challenges = @journey.challenges.order(:position)
  end

  def show
  end

  def new
    @challenge = @journey.challenges.new
  end

  def create
    @challenge = @journey.challenges.new(challenge_params)

    if @challenge.save
      redirect_to journey_challenge_path(@journey, @challenge), notice: "Challenge was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @challenge.update(challenge_params)
      redirect_to journey_challenge_path(@journey, @challenge), notice: "Challenge was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @challenge.destroy
    redirect_to journey_challenges_path(@journey), notice: "Challenge was successfully destroyed."
  end

  private

  def set_journey
    @journey = Journey.find(params[:journey_id])
  end

  def set_challenge
    @challenge = @journey.challenges.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :position, challengeable_attributes: [:class_name])
  end
end
