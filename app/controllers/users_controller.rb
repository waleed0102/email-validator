class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    emails = EmailCombinationGenerator.new(first_name: params[:first_name].downcase,
                                           last_name: params[:last_name].downcase,
                                           url: params[:url]).call
    selected = EmailCombinationValidator.new(emails: emails).call
    if selected
      User.create(user_params.merge(email: selected))
      flash[:notice] = 'User was successfully created'
    else
      flash[:alert] = 'No Valid Email Exists'
    end
    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :url)
  end
end
