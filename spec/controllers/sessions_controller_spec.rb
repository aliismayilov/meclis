# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SessionsController do
  render_views

  describe :create do
    context 'with omniauth info' do
      let!(:auth) { OmniAuth.config.mock_auth[:facebook] }

      before { set_env_with_omniauth_info! }

      it_should_behave_like :action_that_skips_return_path_save do
        before do
          get :create, provider: 'facebook'
        end
      end

      context 'with new user' do
        context 'GET create' do
          before { get :create, provider: 'facebook' }

          it { should redirect_to root_path }

          it 'sets user_id on session' do
            expect(session[:user_id]).to eql(User.find_by(uid: auth["uid"]).id)
          end
        end
      end

      context 'with existing user' do
        let!(:user) { create(:user, provider: 'facebook', uid: auth.uid) }

        context 'GET create' do
          before { get :create, provider: 'facebook' }

          it { should redirect_to root_path }

          it 'set user id on session' do
            expect(session[:user_id]).to eql(user.id)
          end
        end
      end
    end
  end

  describe :failure do
    it_should_behave_like :action_that_skips_return_path_save do
      before { get :failure }
    end

    it 'set flash message' do
      get :failure
      expect(flash[:alert]).to eql 'Could not authenticate, try again.'
    end

    describe 'redirect' do
      context 'no return_path' do
        before do
          session[:return_path] = nil
          get :failure
        end

        it { should redirect_to root_path }
      end
    end
  end

  describe :destroy do
    it_should_behave_like :action_that_skips_return_path_save do
      before do
        get :destroy
      end
    end

    it 'should nullify user_id on sessions' do
      session[:user_id] = '1'

      get :destroy

      expect(session[:user_id]).to be_nil
    end

    it 'should redirect to root_path' do
      get :destroy
      should redirect_to root_path
    end
  end
end
