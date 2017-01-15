class ZabydovnuksController < ApplicationController
  before_action :set_zabydovnuk, only: [:show, :edit, :update, :destroy]

  # GET /zabydovnuks
  # GET /zabydovnuks.json
  def index
    @zabydovnuks = Zabydovnuk.all
  end

  # GET /zabydovnuks/1
  # GET /zabydovnuks/1.json
  def show
    @projects = @zabydovnuk.projects
  end

  # GET /zabydovnuks/new
  def new
    @zabydovnuk = Zabydovnuk.new
  end

  # GET /zabydovnuks/1/edit
  def edit
  end

  # POST /zabydovnuks
  # POST /zabydovnuks.json
  def create
    @zabydovnuk = Zabydovnuk.new(zabydovnuk_params)

    respond_to do |format|
      if @zabydovnuk.save
        format.html { redirect_to @zabydovnuk, notice: 'Zabydovnuk was successfully created.' }
        format.json { render :show, status: :created, location: @zabydovnuk }
      else
        format.html { render :new }
        format.json { render json: @zabydovnuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zabydovnuks/1
  # PATCH/PUT /zabydovnuks/1.json
  def update
    respond_to do |format|
      if @zabydovnuk.update(zabydovnuk_params)
        format.html { redirect_to @zabydovnuk, notice: 'Zabydovnuk was successfully updated.' }
        format.json { render :show, status: :ok, location: @zabydovnuk }
      else
        format.html { render :edit }
        format.json { render json: @zabydovnuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zabydovnuks/1
  # DELETE /zabydovnuks/1.json
  def destroy
    @zabydovnuk.destroy
    respond_to do |format|
      format.html { redirect_to zabydovnuks_url, notice: 'Zabydovnuk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zabydovnuk
      @zabydovnuk = Zabydovnuk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zabydovnuk_params
      params.require(:zabydovnuk).permit(:name, :years_on_market, :projects_count)
    end
end
