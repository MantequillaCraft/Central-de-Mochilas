class ChangeHistoriesController < ApplicationController
  before_action :set_change_history, only: %i[ show edit update destroy ]

  # GET /change_histories or /change_histories.json
  def index
    @change_histories = ChangeHistory.all
  end

  # GET /change_histories/1 or /change_histories/1.json
  def show
  end

  # GET /change_histories/new
  def new
    @change_history = ChangeHistory.new
  end

  # GET /change_histories/1/edit
  def edit
  end

  # POST /change_histories or /change_histories.json
  def create
    @change_history = ChangeHistory.new(change_history_params)

    respond_to do |format|
      if @change_history.save
        format.html { redirect_to @change_history, notice: "Change history was successfully created." }
        format.json { render :show, status: :created, location: @change_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @change_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /change_histories/1 or /change_histories/1.json
  def update
    respond_to do |format|
      if @change_history.update(change_history_params)
        format.html { redirect_to @change_history, notice: "Change history was successfully updated." }
        format.json { render :show, status: :ok, location: @change_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @change_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_histories/1 or /change_histories/1.json
  def destroy
    @change_history.destroy!

    respond_to do |format|
      format.html { redirect_to change_histories_path, status: :see_other, notice: "Change history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_history
      @change_history = ChangeHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def change_history_params
      params.require(:change_history).permit(:modification_date, :change_description, :product_id)
    end
end
