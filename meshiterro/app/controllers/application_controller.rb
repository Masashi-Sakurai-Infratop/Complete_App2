class ApplicationController < ActionController::Base
  # before_actionメソッドは引数にメソッドの本体を直接渡すことはできず、
  # メソッド名をシンボル形式で渡すことで、そのシンボルに対応するメソッドを呼び出します。
  # これはRubyの特徴的な構文であり、メソッドをオブジェクトとして扱うことができる
  # オブジェクト指向プログラミングの概念に基づいています。
  ## before_actionメソッドにメソッド名をシンボル形式で渡し、ifキーにもメソッド名をシンボル形式で渡す。
  
  ## before_actionメソッドはすべてのコントローラが動作する前に実行
  before_action :authenticate_user!, except: [:top]
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
