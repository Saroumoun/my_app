require 'rails_helper'

RSpec.describe GossipsController, type: :controller do

	describe "GET index" do
		it "assigns @gossips" do
	    # création d'une instance
	    gossip = FactoryBot.create(:gossip)

	    # on va sur index
	    get :index

	    # @gossips doit être une array qui contient gossip
	    expect(assigns(:gossips)).to eq([gossip])
		end
	  it "renders the index template" do
	    # va sur index
	    get :index

	    # on doit rediriger vers index
	    expect(response).to render_template("index")
	  end
	end

	describe "GET show" do
	  it "assigns @gossip" do
	    # création d'une instance
    gossip = FactoryBot.create(:gossip)

    get :show, params: { id: gossip.id }
    expect(assigns(:gossip)).to eq(gossip)
	  end
	end

	# context "with valid attributes" do
 #    it "creates a new gossip" do
 #      expect { 
 #        post :create, params: { "gossip" => { title: Faker::Book.title, content: Faker::Hobbit.quote, user: User.all.sample } }
 #      }.to change(Gossip,:count).by(1)
 #    end
    
 #    it "redirects to the new user" do
 #      post :create, params: { "user" => { email: Faker::Internet.email, password: Faker::Internet.password } }

 #      # en général tu rediriges vers le show de ce que tu viens de créer
 #      response.should redirect_to User.last
 #    end
 #  end

  
end
