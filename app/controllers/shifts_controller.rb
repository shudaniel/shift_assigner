class ShiftsController < ApplicationController
  before_action :load_parent, only: [:create, :index]
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @shifts = @parent.shifts
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = @parent.shifts.new(shift_params)
    @shift.set_shift_description
    @shift.set_day_of_week(params)
    respond_to do |format|
      if @shift.save
        format.html { redirect_to (@shift), notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    @shift.set_shift_description
    @shift.set_day_of_week(params)

    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    parent = @shift.calendar
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to parent, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def load_parent
      @parent = Calendar.find(params[:calendar_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:title, :description, :start_time, :end_time, :max_employees, :assigned_to => [])
    end
end
