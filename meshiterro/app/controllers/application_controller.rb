class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) ##デフォルトの場合はroot_pathになってる
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

# configureは「設定する」という他動詞,だからconfigure_permitted_parametersは「許可されたパラメータを設定する」になる
  def configure_permitted_parameters
    # deviseは考案するの意味、だからdevise_parameter_sanitizerは「パラメータサニタイズ関数を考案する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
