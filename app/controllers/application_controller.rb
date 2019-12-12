class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production? 
  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :get_active_hash, only: [:create]

  protect_from_forgery with: :null_session

  private

  def production?
    Rails.env.production?
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password, :email, :nickname, :family_name_kana, :family_name_kanji, :first_name_kana, :first_name_kanji, :year, :month, :day])
  end

  def get_active_hash
    @year = Years.all
    @month = Months.all
    @day = Days.all
  end


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end