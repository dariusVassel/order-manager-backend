class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  skip_before_action :authorized, only: [ :create]

  # GET /users
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
    @user = User.new(user_params)

    respond_to do |format|
    if @user.save
      @token = encode_token({user_id: @user.id})
      #render json: {user: @user, token: @token}, status: :created, location: @user
      
      ####USER MAILER####
      UserMailer.with(user: @user, user_info: @user.user_info).welcome_email.deliver_later

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        #format.json { render json: {user: @user, token: @token}, status: :created, location: api_user_path(@user) }
        format.json { render json: {user: @user, token: @token}, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: {errors: ["Username already taken"]}, status: :unprocessable_entity }
      ####USER MAILER####
 
    #else
      # render json: @user.errors, status: :unprocessable_entity
      #render json: {errors: ["Username already taken"]}, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :role, :organization_id)
    end
end
