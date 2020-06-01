class DriversController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @driver = Driver.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      flash.notice = "The driver record was created successfully."
      redirect_to @driver
    else
      flash.now.alert = @driver.errors.full_messages.to_sentence
      render :new  
    end
  end

  def update
    if @driver.update(driver_params)
      flash.notice = "The driver record was updated successfully."
      redirect_to @driver
    else
      flash.now.alert = @driver.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def driver_params
      params.require(:driver).permit(:first_name, :last_name, :phone, :email)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to drivers_path
    end

end
