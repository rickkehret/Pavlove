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

describe InspirationsController do

  # This should return the minimal set of attributes required to create a valid
  # Inspiration. As you add validations to Inspiration, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all inspirations as @inspirations" do
      inspiration = Inspiration.create! valid_attributes
      get :index
      assigns(:inspirations).should eq([inspiration])
    end
  end

  describe "GET show" do
    it "assigns the requested inspiration as @inspiration" do
      inspiration = Inspiration.create! valid_attributes
      get :show, :id => inspiration.id
      assigns(:inspiration).should eq(inspiration)
    end
  end

  describe "GET new" do
    it "assigns a new inspiration as @inspiration" do
      get :new
      assigns(:inspiration).should be_a_new(Inspiration)
    end
  end

  describe "GET edit" do
    it "assigns the requested inspiration as @inspiration" do
      inspiration = Inspiration.create! valid_attributes
      get :edit, :id => inspiration.id
      assigns(:inspiration).should eq(inspiration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Inspiration" do
        expect {
          post :create, :inspiration => valid_attributes
        }.to change(Inspiration, :count).by(1)
      end

      it "assigns a newly created inspiration as @inspiration" do
        post :create, :inspiration => valid_attributes
        assigns(:inspiration).should be_a(Inspiration)
        assigns(:inspiration).should be_persisted
      end

      it "redirects to the created inspiration" do
        post :create, :inspiration => valid_attributes
        response.should redirect_to(Inspiration.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inspiration as @inspiration" do
        # Trigger the behavior that occurs when invalid params are submitted
        Inspiration.any_instance.stub(:save).and_return(false)
        post :create, :inspiration => {}
        assigns(:inspiration).should be_a_new(Inspiration)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Inspiration.any_instance.stub(:save).and_return(false)
        post :create, :inspiration => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested inspiration" do
        inspiration = Inspiration.create! valid_attributes
        # Assuming there are no other inspirations in the database, this
        # specifies that the Inspiration created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Inspiration.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => inspiration.id, :inspiration => {'these' => 'params'}
      end

      it "assigns the requested inspiration as @inspiration" do
        inspiration = Inspiration.create! valid_attributes
        put :update, :id => inspiration.id, :inspiration => valid_attributes
        assigns(:inspiration).should eq(inspiration)
      end

      it "redirects to the inspiration" do
        inspiration = Inspiration.create! valid_attributes
        put :update, :id => inspiration.id, :inspiration => valid_attributes
        response.should redirect_to(inspiration)
      end
    end

    describe "with invalid params" do
      it "assigns the inspiration as @inspiration" do
        inspiration = Inspiration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Inspiration.any_instance.stub(:save).and_return(false)
        put :update, :id => inspiration.id, :inspiration => {}
        assigns(:inspiration).should eq(inspiration)
      end

      it "re-renders the 'edit' template" do
        inspiration = Inspiration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Inspiration.any_instance.stub(:save).and_return(false)
        put :update, :id => inspiration.id, :inspiration => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inspiration" do
      inspiration = Inspiration.create! valid_attributes
      expect {
        delete :destroy, :id => inspiration.id
      }.to change(Inspiration, :count).by(-1)
    end

    it "redirects to the inspirations list" do
      inspiration = Inspiration.create! valid_attributes
      delete :destroy, :id => inspiration.id
      response.should redirect_to(inspirations_url)
    end
  end

end
