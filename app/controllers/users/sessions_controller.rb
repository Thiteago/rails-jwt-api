class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(resource, _opts = {})
    render json: {
      message: "Logado com sucesso!",
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    logout_success && return if current_user

    logout_failure
  end

  def logout_success
    render json: {
      message: "Deslogado com sucesso!"
    }, status: :ok
  end

  def logout_failure
    render json: { message: "Something went wrong." }, status: :unprocessable_entity
  end
end