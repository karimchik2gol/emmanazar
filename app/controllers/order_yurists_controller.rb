class OrderYuristsController < ApplicationController
  before_action :set_order_yurist, only: [:show, :edit, :update, :destroy]

  # GET /order_yurists
  # GET /order_yurists.json
  def index
    @order_yurists = OrderYurist.all
  end

  # GET /order_yurists/1
  # GET /order_yurists/1.json
  def show
  end

  # GET /order_yurists/new
  def new
    @order_yurist = OrderYurist.new
    set_project_and_apartments
  end

  # GET /order_yurists/1/edit
  def edit
    @projects = Project.all
    @apartments = @order_yurist.project.apartments
  end

  # POST /order_yurists
  # POST /order_yurists.json
  def create
    @order_yurist = OrderYurist.new(order_yurist_params)

    respond_to do |format|
      if @order_yurist.save
        format.html { redirect_to @order_yurist, notice: 'Order yurist was successfully created.' }
        format.json { render :show, status: :created, location: @order_yurist }
      else
        set_project_and_apartments
        format.html { render :new }
        format.json { render json: @order_yurist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_yurists/1
  # PATCH/PUT /order_yurists/1.json
  def update
    respond_to do |format|
      if @order_yurist.update(order_yurist_params)
        format.html { redirect_to @order_yurist, notice: 'Order yurist was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_yurist }
      else
        set_project_and_apartments
        format.html { render :edit }
        format.json { render json: @order_yurist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_yurists/1
  # DELETE /order_yurists/1.json
  def destroy
    @order_yurist.destroy
    respond_to do |format|
      format.html { redirect_to order_yurists_url, notice: 'Order yurist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project_and_apartments
      @projects = Project.all
      @apartments = @projects.first.apartments
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_order_yurist
      @order_yurist = OrderYurist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_yurist_params
      params.require(:order_yurist).permit(:project_id, :apartment_id, :yurist_id)
    end
end
