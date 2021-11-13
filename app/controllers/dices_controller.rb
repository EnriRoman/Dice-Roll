class DicesController < ApplicationController
  before_action :set_dice, only: %i[ show edit update destroy ]

  # GET /dices or /dices.json
  def index
    @dices = Dice.all
  end

  # GET /dices/1 or /dices/1.json
  def show
    number=@dice.dice_number #Number of dice
    sides=@dice.dice_sides #sides
    @roll_array = [] #array to store multiple results of dices
    number.times do
      @roll_array << (rand(sides) + 1)
    end
    @total = 0
    @roll_array.each do |roll|
      new_total = @total + roll
      @total = new_total #total of all results
    end
    return @roll_array,@total
  end


  # GET /dices/new
  def new
    @dice = Dice.new
  end

  # GET /dices/1/edit
  def edit
  end

  # POST /dices or /dices.json
  def create
    @dice = Dice.new(dice_params)

    respond_to do |format|
      if @dice.save
        format.html { redirect_to @dice, notice: "Dice was successfully created." }
        format.json { render :show, status: :created, location: @dice }
      else
        form
        at.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dices/1 or /dices/1.json
  def update
    respond_to do |format|
      if @dice.update(dice_params)
        format.html { redirect_to @dice, notice: "Dice was successfully updated." }
        format.json { render :show, status: :ok, location: @dice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dices/1 or /dices/1.json
  def destroy
    @dice.destroy
    respond_to do |format|
      format.html { redirect_to dices_url, notice: "Dice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dice
      @dice = Dice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dice_params
      params.require(:dice).permit(:dice_number, :dice_sides)
    end
end
