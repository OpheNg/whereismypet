class PetsController < ApplicationController
  def index
    @user = current_user
    if params[:query].present?
      sql_query = " \
      pets.name ILIKE :query \
      OR pets.specie ILIKE :query \
      OR pets.status ILIKE :query \
      "
      @pets = Pet.where(sql_query, query: "%#{params[:query]}%")
    else
      @user = current_user
      @pets = Pet.all
    end
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet }),
        image_url: helpers.asset_url("paws.png")
      }
    end
  end

  def show
    @user = current_user
    @pet = Pet.find(params[:id])
    @pets = Pet.all
  end

  def new
    @user = current_user
    @pet = Pet.new
  end

  def create
    @user = current_user
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    redirect_to pets_path if @pet.save
  end

  def edit
    @user = current_user
    @pet = Pet.find(params[:id])
  end

  def update
    @user = current_user
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params_update)
      redirect_to pet_path(@pet.id)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @pet = Pet.find(params[:id])
    redirect_to pets_path if @pet.destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:sex,:name,:specie,:color,:breed,:age,:address,:event_date,:email,:tel,:owner,:user_id, :status, :details, :photo, :city)
  end

  def pet_params_update
    params.require(:pet).permit(:sex, :name,:specie,:color,:breed,:age,:address,:event_date,:email,:tel,:owner, :status, :details, :photo, :city)

    # this is a test
  end
end
