class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :filter_resource!, only: [:callback]

  # callback
  def callback
    @resource = @klass.find_or_create_with params[:provider],
                                           request.env['omniauth.auth'],
                                           request.env['omniauth.params']

    return redirect_to root_path, alert: 'Something went wrong.' unless @resource
    if @resource.persisted?
      sign_in_and_redirect @resource
    else
      session["devise.#{params[:provider]}_data"] = request.env['omniauth.auth']

      redirect_to root_path, notice: 'Auth failure.'
    end
  end

  def passthru

  end

  private

  def filter_resource!
    @klass = request.env['omniauth.origin'] == new_teacher_session_url ? Teacher : Student

    fail 'e' unless SocialAuthenticatable.classes.include? @klass
  end
end
