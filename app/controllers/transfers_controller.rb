class TransfersController < ApplicationController

  before_action :set_transfer, only: %i[ show edit update destroy ]
  before_action :verify_transfer, only: [:create]

  # GET /transfers or /transfers.json
  def index
    @transfers = current_user.account.transfers
  end

  # GET /transfers/1 or /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers or /transfers.json
  def create
    @transfer = current_user.account.transfers.new(transfer_params)

    respond_to do |format|
      if @transfer.save
        BankOperations.increment_decrement(@transfer.id, @transfer.account_to, @transfer.amount)
        format.html { redirect_to transfer_url(@transfer), notice: "Transferência realizada com sucesso." }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1 or /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to transfer_url(@transfer), notice: "Transferência atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1 or /transfers/1.json
  def destroy
    @transfer.destroy

    respond_to do |format|
      format.html { redirect_to transfers_url, notice: "Verifique! Transferência não pode ser excluída." }
      format.json { head :no_content }
    end
  end

  private

    def verify_transfer
      account_to = Account.find_by(id: transfer_params[:account_to])
      @transfer = current_user.account.transfers.new(transfer_params)
      last_balance = current_user.account.get_balance
      if @transfer.amount.to_f + BankOperations.get_tax(@transfer.amount)  > last_balance
        @transfer.errors.add(:message, "Saldo insuficiente.")
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @transfer.errors, status: :unprocessable_entity}
        end
      elsif account_to.nil?
        @transfer.errors.add(:message, 'Conta não encontrada.')
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @transfer.errors, status: :unprocessable_entity}
        end
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transfer_params
      params.require(:transfer).permit(:account_id, :amount, :account_to)
    end
end
