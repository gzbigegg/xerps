class AccountTypesController < AuthorizedController
  def new
  end
  
  def create
    if @account_type.save
      flash[:notice] = "Account type was created successfully"
      redirect_to account_types_path
    else
      flash[:error] = "Failed to create account type"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @account_type.update_attributes(params[:account_type])
      flash[:notice] = "Account type was updated successfully"
      redirect_to account_type_path(@account_type)
    else
      flash[:error] = "Failed to update account type"
      render :edit
    end
  end
end
