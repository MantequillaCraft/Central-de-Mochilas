class ReserveOrPurchasesController < ApplicationController
  before_action :no_allowed, only: [ :show ]
  before_action :set_reserve_or_purchase, only: %i[ show edit update destroy ]

  # GET /reserve_or_purchases or /reserve_or_purchases.json
  def index
    @reserve_or_purchases = ReserveOrPurchase.all
  end

  # GET /reserve_or_purchases/1 or /reserve_or_purchases/1.json
  def show
  end

  # GET /reserve_or_purchases/new
  def new
    @reserve_or_purchase = ReserveOrPurchase.new
  end

  # GET /reserve_or_purchases/1/edit
  def edit
  end

  # POST /reserve_or_purchases or /reserve_or_purchases.json
  def create
    @reserve_or_purchase = ReserveOrPurchase.new(reserve_or_purchase_params)

    respond_to do |format|
      if @reserve_or_purchase.save
        format.html { redirect_to @reserve_or_purchase, notice: "Reserve or purchase was successfully created." }
        format.json { render :show, status: :created, location: @reserve_or_purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserve_or_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserve_or_purchases/1 or /reserve_or_purchases/1.json
  def update
    respond_to do |format|
      if @reserve_or_purchase.update(reserve_or_purchase_params)
        format.html { redirect_to @reserve_or_purchase, notice: "Reserve or purchase was successfully updated." }
        format.json { render :show, status: :ok, location: @reserve_or_purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserve_or_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserve_or_purchases/1 or /reserve_or_purchases/1.json
  def destroy
    @reserve_or_purchase.destroy!

    respond_to do |format|
      format.html { redirect_to reserve_or_purchases_path, status: :see_other, notice: "Reserve or purchase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserve_or_purchase
      @reserve_or_purchase = ReserveOrPurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserve_or_purchase_params
      params.require(:reserve_or_purchase).permit(:customer_name, :product_name, :desired_quantity, :payment_method, :product_id, :customer_id)
    end

    def no_allowed
      redirect_to reserve_or_purchases_path
    end
    
end
