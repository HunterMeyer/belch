class TrainersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @trainer = Trainer.find(params[:id])
    @ratings = @trainer.ratings.count
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.find_or_create_by(identifier: trainer_params[:identifier].downcase)
    if @trainer.save
      redirect_to trainer_path(@trainer.id)
    else
      @error = 'Identifier already taken. Please try another'
      render :new
    end
  end

  private

  def trainer_params
    params.require(:trainer).permit(:identifier)
  end
end
