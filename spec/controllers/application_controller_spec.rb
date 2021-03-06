# encoding: utf-8

require 'spec_helper'

describe ApplicationController do
  let(:user) { create(:user) }

  describe '#current_user' do
    context 'user signed in' do
      before do
        session[:user_id] = user.id
      end

      it 'returns the user' do
        expect(controller.send(:current_user)).to eql user
      end
    end

    context 'user signed in with invalid id' do
      before do
        session[:user_id] = 666
      end

      it 'deletes user_id from session' do
        expect {
          controller.send(:current_user)
        }.to change { session[:user_id] }.from(666).to(nil)
      end

      it 'returns nil' do
        expect(controller.send(:current_user)).to be_nil
      end
    end

    context 'user is not signed in' do
      it 'returns nil' do
        expect(controller.send(:current_user)).to be_nil
      end
    end
  end

  describe '#user_signed_in?' do
    context 'user is signed in' do
      before do
        session[:user_id] = user.id
      end

      it 'returns true' do
        expect(controller).to be_user_signed_in
      end
    end

    context 'user is not signed in' do
      it 'returns false' do
        expect(controller).to_not be_user_signed_in
      end
    end
  end

  describe '#authenticate!' do
    context 'user is signed in' do
      before do
        session[:user_id] = user.id
      end

      it 'ignores redirection and proceeds' do
        expect(controller).to_not receive(:redirect_to)
        controller.send :authenticate!
      end
    end

    context 'user is not signed in' do
      it 'redirects to login' do
        redirect = double('redirect')
        request.define_singleton_method :fullpath do
          '/potato'
        end

        expect(controller)
          .to receive(:redirect_to)
          .with(login_url(provider: 'facebook', origin: '/potato'),
                notice: 'You must be authenticated...')
          .and_return(redirect)

        expect(controller.send(:authenticate!)).to eql redirect
      end
    end
  end
end
