class Admin::FeesController < Admin::BaseController
  before_action :find_fee, only: [:edit, :update, :destroy]

  def index
    @feeses = Fee.all
  end

  def new
    @branch_classes = current_user.branch.branch_classes
    @fee = Fee.new
  end

  def create
    @fee = Fee.new(fee_params)
    if @fee.save
      redirect_to admin_fees_path
    else
      render 'new'
    end
  end

  def edit
    @branch_classes = current_user.branch.branch_classes
  end

  def update
    if @fee.update(fee_params)
      redirect_to admin_fees_path
    else
      render 'edit'
    end
  end

  def destroy
    if @fee.destroy
      flash[:success] = "Fee Delete successfully"
    else
      flash[:alert] = "Unable to delete"
    end
      redirect_to admin_fees_path
  end
  private

  def find_fee
    @fee = Fee.find_by(id: params[:id])
  end

  def fee_params
    params.require(:fee).permit(:branch_class_id, :amount)
  end

end
