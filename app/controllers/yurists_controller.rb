class YuristsController < ApplicationController
  before_action :set_yurist, only: [:show, :edit, :update, :destroy]

  # GET /yurists
  # GET /yurists.json
  def index
    @yurists = Yurist.all
  end

  # GET /yurists/1
  # GET /yurists/1.json
  def show
  end

  # GET /yurists/new
  def new
    @yurist = Yurist.new
  end

  # GET /yurists/1/edit
  def edit
  end

  # POST /yurists
  # POST /yurists.json
  def create
    @yurist = Yurist.new(yurist_params)

    respond_to do |format|
      if @yurist.save
        format.html { redirect_to @yurist, notice: 'Yurist was successfully created.' }
        format.json { render :show, status: :created, location: @yurist }
      else
        format.html { render :new }
        format.json { render json: @yurist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yurists/1
  # PATCH/PUT /yurists/1.json
  def update
    respond_to do |format|
      if @yurist.update(yurist_params)
        format.html { redirect_to @yurist, notice: 'Yurist was successfully updated.' }
        format.json { render :show, status: :ok, location: @yurist }
      else
        format.html { render :edit }
        format.json { render json: @yurist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yurists/1
  # DELETE /yurists/1.json
  def destroy
    @yurist.destroy
    respond_to do |format|
      format.html { redirect_to yurists_url, notice: 'Yurist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yurist
      @yurist = Yurist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yurist_params
      params.require(:yurist).permit(:person_id, :status)
    end
end
