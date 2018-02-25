class TraitGenresController < ApplicationController
  before_action :set_trait_genre, only: [:show, :edit, :update, :destroy]

  # GET /trait_genres
  # GET /trait_genres.json
  def index
    @trait_genres = TraitGenre.all
  end

  # GET /trait_genres/1
  # GET /trait_genres/1.json
  def show
  end

  # GET /trait_genres/new
  def new
    @trait_genre = TraitGenre.new
    @traits = Trait.all
  end

  # GET /trait_genres/1/edit
  def edit
  end

  # POST /trait_genres
  # POST /trait_genres.json
  def create
    @trait_genre = TraitGenre.new(trait_genre_params)

    respond_to do |format|
      if @trait_genre.save
        format.html { redirect_to @trait_genre, notice: 'Trait genre was successfully created.' }
        format.json { render :show, status: :created, location: @trait_genre }
      else
        format.html { render :new }
        format.json { render json: @trait_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trait_genres/1
  # PATCH/PUT /trait_genres/1.json
  def update
    respond_to do |format|
      if @trait_genre.update(trait_genre_params)
        format.html { redirect_to @trait_genre, notice: 'Trait genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @trait_genre }
      else
        format.html { render :edit }
        format.json { render json: @trait_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trait_genres/1
  # DELETE /trait_genres/1.json
  def destroy
    @trait_genre.destroy
    respond_to do |format|
      format.html { redirect_to trait_genres_url, notice: 'Trait genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trait_genre
      @trait_genre = TraitGenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trait_genre_params
      params.require(:trait_genre).permit(:trait_id, :genre_id)
    end
end
