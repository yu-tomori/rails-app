class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # シンボルで引数を指定
  def twitter
    callback_from :twitter
  end
  # request.envはhttpリクエストのリクエストヘッダの変数を取得するメソッド
  private

    def callback_from(provider)
      provider = provider.to_s
      
      @user = User.find_for_oauth(request.env['omniauth.auth'])

      # .persisted? => Railsのメソッドで、保存済みのデータであるかチェックする.
      # sign_in_and_redirect => Devise::Controllers::Helpers#sign_in_and_redirect, defined in : lib/devise/controllers/helpers.rb  
      if @user.persisted?
        print("persisted true")
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
        session[:user_id] = @user.id
        sign_in_and_redirect @user, event: :authentication
      else
        print("persisted false")
        session["devise.#{provider}_data"] = request.env['omniauth.auth']
        redirect_to controller: 'sessions', action: 'new'
      end
    end
end
