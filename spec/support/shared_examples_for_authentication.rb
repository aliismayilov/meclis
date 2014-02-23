shared_examples_for :action_that_requires_authentication do
  context :not_logged_in do
    it { expect(flash[:notice]).to eql("You must be authenticated...") }
    it {
      origin = request.post? ? root_url : request.fullpath
      should redirect_to(login_url(provider: 'facebook',
                                   origin: origin))
    }
  end
end

# TODO: add the reverse scenario and apply it for all actions oO
shared_examples_for :action_that_skips_return_path_save do
  before { session[:return_path] = '/potato' }
  it { expect(session[:return_path]).to eql('/potato') }
end
