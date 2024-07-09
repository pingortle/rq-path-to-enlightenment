class KoansController < ApplicationController
  before_action :set_koan, only: %i[ show edit update destroy ]

  # GET /koans or /koans.json
  def index
    @koans = Koan.all
  end

  # GET /koans/1 or /koans/1.json
  def show
  end

  # GET /koans/new
  def new
    @koan = Koan.new
  end

  # GET /koans/1/edit
  def edit
  end

  # POST /koans or /koans.json
  def create
    @koan = Koan.new(koan_params)

    respond_to do |format|
      if @koan.save
        format.html { redirect_to koan_url(@koan), notice: "Koan was successfully created." }
        format.json { render :show, status: :created, location: @koan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @koan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /koans/1 or /koans/1.json
  def update
    respond_to do |format|
      if @koan.update(koan_params)
        format.html { redirect_to koan_url(@koan), notice: "Koan was successfully updated." }
        format.json { render :show, status: :ok, location: @koan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @koan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /koans/1 or /koans/1.json
  def destroy
    @koan.destroy!

    respond_to do |format|
      format.html { redirect_to koans_url, notice: "Koan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_koan
      @koan = Koan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def koan_params
      params.require(:koan).permit(:title, :description, :initial_code, :order)
    end
end
