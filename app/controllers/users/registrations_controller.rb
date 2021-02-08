# frozen_string_literal: true

# devise/userには存在しないカラム（group_name）を追加するためにコントローラを作成

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up

    #親クラスから機能を継承
    # superにdo endをつけ、その間に紐付けるというコードを書くことで
    # def new
    # build_resource
    # yield resource if block_given?
    # respond_with resource
    # end
    # のyieldの部分にブロックを入れることができ、deviseの機能のsign_up&sign_inの際に
    # 親の情報も紐付けて登録できる
    def new
      super do
        resource.group ||= Group.new
      end

    end

  # POST /resource
  # def create

  #   super
  #   #railsルール→＠なしはコントロール内でのみ使用を意味し、＠ありはviewでの使用を意味する
  #   #newでgroupnameの弥型を作成し、グループへ保存
  #   #@userにパスワードが渡っていなかったのでparamsで渡せるようにして保存
  #   group = Group.new(group_name: params[:group_name])
  #   group.save
  #   @user.group_id = group.id
  #   @user.password = params[:user][:password]
  #   @user.password_confirmation = params[:user][:password_confirmation]
  #   @user.save
  #   sign_in @user
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end