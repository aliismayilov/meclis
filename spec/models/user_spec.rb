require 'spec_helper'

describe User do
  describe :validations do
    it { should validate_presence_of    :email }
    it { should validate_uniqueness_of  :email }

    it { should validate_presence_of    :uid }
    it { should validate_uniqueness_of  :uid }

    it { should validate_presence_of    :access_token }
    it { should validate_uniqueness_of  :access_token }
  end

  describe :associations do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:votes) }
  end

  describe '.find_or_create_with_omniauth' do
    let(:auth) do
      {
        provider: 'facebook', uid: '123456',
        credentials: { token: 'AAADv' },
        extra: {}, info: {
          email: 'ali@ismailov.info',
          name: 'Ali Ismayilov'
        }
      }.with_indifferent_access
    end

    context 'user does not exists' do
      describe 'creating a new user' do
        it 'creates a new user' do
          expect {
            new_user = User.find_or_create_with_omniauth(auth)

            expect(new_user).to be_recently_created

          }.to change(User, :count).by(1)
        end
      end

      describe 'setting data on new user' do
        subject { User.find_or_create_with_omniauth(auth) }

        its(:access_token)  { should eql 'AAADv'                    }
        its(:provider)      { should eql 'facebook'                 }
        its(:uid)           { should eql '123456'                   }
        its(:name)          { should eql 'Ali Ismayilov'            }
        its(:email)         { should eql 'ali@ismailov.info'        }
      end
    end

    context 'user already exists' do
      let!(:existing_user) do
        create(:user, provider: 'facebook', uid: '123456')
      end

      describe 'finding existing user' do
        it 'finds existing user' do
          expect(User.find_or_create_with_omniauth(auth)).to eql(existing_user)
        end

        it 'does not create a user' do
          expect {
            old_user = User.find_or_create_with_omniauth(auth)

            expect(old_user).to_not be_recently_created

          }.to_not change(User, :count)
        end
      end

      describe 'updating existing user' do
        before do
          User.find_or_create_with_omniauth(auth)
        end

        subject { existing_user.reload }

        its(:access_token)  { should eql 'AAADv'                    }
        its(:provider)      { should eql 'facebook'                 }
        its(:uid)           { should eql '123456'                   }
        its(:name)          { should eql 'Ali Ismayilov'            }
        its(:email)         { should eql 'ali@ismailov.info'        }
      end
    end
  end
end
