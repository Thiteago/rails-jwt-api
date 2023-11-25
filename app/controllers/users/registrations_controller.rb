class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failure
  end

  def register_success
    render json: {
      message: "Registrado com sucesso!",
      user: current_user
    }, status: :created
  end

  def register_failure
    render json: { message: "Something went wrong." }, status: :unprocessable_entity
  end
end