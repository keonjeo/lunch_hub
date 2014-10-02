require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AnnouncementsController do

  # This should return the minimal set of attributes required to create a valid
  # Announcement. As you add validations to Announcement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      user_id: FactoryGirl.create(:user).id,
      restaurant_name: "Bangkok Taste"
    }
  }

  let(:default_params) { { format: :json } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnnouncementsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all announcements as @announcements" do
      announcement = Announcement.create! valid_attributes
      get :index, {}, valid_session
      assigns(:announcements).should eq([announcement])
    end
  end

  describe "GET show" do
    it "assigns the requested announcement as @announcement" do
      announcement = Announcement.create! valid_attributes
      get :show, {:id => announcement.to_param}, valid_session
      assigns(:announcement).should eq(announcement)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Announcement" do
        expect {
          post :create, {:announcement => valid_attributes}, valid_session
        }.to change(Announcement, :count).by(1)
      end

      it "assigns a newly created announcement as @announcement" do
        post :create, {:announcement => valid_attributes}, valid_session
        assigns(:announcement).should be_a(Announcement)
        assigns(:announcement).should be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved announcement as @announcement" do
        # Trigger the behavior that occurs when invalid params are submitted
        Announcement.any_instance.stub(:save).and_return(false)
        post :create, {:announcement => { "user_id" => "invalid value" }}, valid_session
        assigns(:announcement).should be_a_new(Announcement)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested announcement" do
        announcement = Announcement.create! valid_attributes
        # Assuming there are no other announcement in the database, this
        # specifies that the Announcement created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Announcement.any_instance.should_receive(:update).with({ "user_id" => "" })
        put :update, {:id => announcement.to_param, :announcement => { "user_id" => "" }}, valid_session
      end

      it "assigns the requested announcement as @announcement" do
        announcement = Announcement.create! valid_attributes
        put :update, {:id => announcement.to_param, :announcement => valid_attributes}, valid_session
        assigns(:announcement).should eq(announcement)
      end
    end

    describe "with invalid params" do
      it "assigns the announcement as @announcement" do
        announcement = Announcement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Announcement.any_instance.stub(:save).and_return(false)
        put :update, {:id => announcement.to_param, :announcement => { "user" => "invalid value" }}, valid_session
        assigns(:announcement).should eq(announcement)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested announcement" do
      announcement = Announcement.create! valid_attributes
      expect {
        delete :destroy, {:id => announcement.to_param}, valid_session
      }.to change(Announcement, :count).by(-1)
    end
  end

end
