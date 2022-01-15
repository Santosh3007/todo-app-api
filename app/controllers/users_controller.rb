class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users      //Remove this, not necessary
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    if User.exists?(email: user_params[:email])
        render json: {message: "Account already exists"}, status: :existing_account #Status anyhow check if got error
    else
        @user = User.new(user_params)
        if @user.save
            auth_token = AuthenticateUser.call(@user.email, @user.password).result
            render json: {message: "Account created", auth_token: auth_token}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: {message: "Account Updated"}, status: :updated #status anyhow, if error use ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user
        @user.destroy
        render json: {message: "Account deleted"}, status: :deleted
    else
        render json: {message: "Unable to delete account"}, status: :bad_request
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation) #ADD ALL REQUIRED PARAMS IN REQUIRED
    end
end
