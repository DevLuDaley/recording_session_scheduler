class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @engineer = Engineer.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @engineer
  end

end