class AnimalsController < ApplicationController
before_filter :set_animal, only: [:show, :edit, :update, :destroy, :change_status_sold, :change_status_for_sale, :summary, :price]

  # GET /animals
  # GET /animals.json
  def index
    #try
    @animal = Animal.where(nil) # creates an anonymous scope
    @animal = @animal.species(params[:species]) if params[:species].present?
    @animal = @animal.breed(params[:breed]) if params[:breed].present?
    @animal = @animal.breed(params[:price]) if params[:price].present?
    @animal = @animal.breed(params[:status]) if params[:status].present?
    #

    @animals = Animal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @animals }
    end
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
    @animal = Animal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @animal }
    end
  end

  # GET /animals/new
  # GET /animals/new.json
  def new
    @animal = Animal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @animal }
    end
  end

  # GET /animals/1/edit
  def edit
    @animal = Animal.find(params[:id])
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(params[:animal])

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render json: @animal, status: :created, location: @animal }
      else
        format.html { render action: "new" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /animals/1
  # PUT /animals/1.json
  def update
    @animal = Animal.find(params[:id])

    respond_to do |format|
      if @animal.update_attributes(params[:animal])
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_status_sold
    @animal.status= "Sold"
    @animal.save
    redirect_to animals_path
end

  def change_status_for_sale
    @animal.status= "For Sale"
    @animal.save
    redirect_to animals_path
end


 def summary
    #@animal = Animal.find(params[:id])
    #@animal.summary
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url }
      format.json { head :no_content }
    end
  end


private
     # Use callbacks to share common setup or constraints between actions.
     def set_animal
     id = params[:animal_id] || params[:id]
      @animal = Animal.find(id)
     end
end