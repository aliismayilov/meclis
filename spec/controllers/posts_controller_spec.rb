require 'spec_helper'

describe PostsController do
  describe :index do
    before { get :index }

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should render_with_layout(:application) }
  end
end
