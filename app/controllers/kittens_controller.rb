class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kittens_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to kittens_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
