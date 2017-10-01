class TrainersController < ApplicationController
  BEERS_PER_PAGE = 50

  def find
    @trainer = Trainer.find_by(identifier: params[:identifier])
    if @trainer
      redirect_to trainer_path(@trainer.id)
    else
      @error = 'Does not exists...'
      render :new
    end
  end

  def show
    current_trainer
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.create(trainer_params)
    if @trainer.save
      redirect_to trainer_path(@trainer.id)
    else
      @error = 'Identifier already taken. Please try another'
      render :new
    end
  end

  def unrated_beers
    offset = params[:page].to_i * BEERS_PER_PAGE
    @beers = current_trainer.unrated_beers.limit(BEERS_PER_PAGE).offset(offset)
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

  def trainer_params
    params.require(:trainer).permit(:identifier)
  end

  def current_trainer
    @trainer ||= Trainer.find(params[:id])
  end
end
