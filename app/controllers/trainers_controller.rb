class TrainersController < ApplicationController
  BEERS_PER_PAGE = 50

  def show
    current_trainer
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.find_or_create_by(identifier: params[:trainer][:identifier].downcase)
    if @trainer.save
      redirect_to trainer_path(@trainer.id)
    else
      @error = 'Identifier already taken. Please try another'
      render :new
    end
  end

  def unrated_beers
    @beers = current_trainer.unrated_beers.limit(BEERS_PER_PAGE)
                            .select(:external_id, :name, :brewery_name, :icon)
    render json: @beers
  end

  def rate_beer
    options = {
      trainer:          current_trainer,
      beer_external_id: params[:beer_external_id],
      rating:           params[:rating]
    }
    @rating = TrainerBeerRating.create(options)
    render json: :ok
  end

  private

  def current_trainer
    @trainer ||= Trainer.find(params[:id])
  end
end
