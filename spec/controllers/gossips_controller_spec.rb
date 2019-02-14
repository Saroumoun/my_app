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
		  it "renders the show template" do
	    # va sur show
	    gossip = FactoryBot.create(:gossip)
	    get :show, params: { id: gossip.id }

	    # on doit rediriger vers show
	    expect(response).to render_template("show")
  	end
	end

	describe "POST create" do
		context "with valid attributes" do
	    it "creates a new gossip" do
	    	gossip = FactoryBot.create(:gossip)

	    	
	    	expect{post :create, params: {title: gossip.title, content: gossip.content}, session: {user_id: gossip.user.id}}.to change(Gossip,:count).by(1)
	    end
	    it "redirects to the new gossip" do
	    	gossip = FactoryBot.create(:gossip)
	      post :create, params: {title: gossip.title, content: gossip.content}, session: {user_id: gossip.user.id}

	      # en général tu rediriges vers le show de ce que tu viens de créer
	      expect(response).to redirect_to Gossip.last
	    end
	  end

	  context "with invalid attributes" do
	    it "doest not create a new gossip" do
	    	gossip = FactoryBot.create(:gossip)
	    	
	    	expect{post :create, params: {title: gossip.title, content: nil}}.to_not change(Gossip,:count)
	    end
	    it "re-renders the new method" do
	      gossip = FactoryBot.create(:gossip)
	      post :create, params: {title: gossip.title, content: nil}
	      expect(response).to render_template :new
	    end
	  end
	end

	describe "GET edit" do
  	it "assigns @gossips" do
	    # création d'une instance
	    gossip = FactoryBot.create(:gossip)

	    # on va sur edit
	    get :edit, params: { id: gossip.id }

	    # @user doit être user
	    expect(assigns(:gossip)).to eq(gossip)
  	end

  	it "renders the edit template" do
	    # va sur edit
	    gossip = FactoryBot.create(:gossip)
	    get :edit, params: { id: gossip.id }

	    # on doit rediriger vers edit
	    expect(response).to render_template("edit")
  	end
	end

	describe "PUT update" do
	  before :each do
	    @gossip = FactoryBot.create(:gossip)
	  end


	  context "with valid attributes" do
	    it "located the requested @gossip" do
	    	put :update, params: { id: @gossip.id, "gossip" => { title: Faker::Book.title, content: Faker::Hobbit.quote } }

	      expect(assigns(:gossip)).to eq(@gossip)      
	    end
	  
	    it "changes @gossip's attributes" do
	      title = Faker::Book.title
	      content = Faker::Hobbit.quote
	      put :update, params: { id: @gossip.id, "gossip" => { title: "My title", content: "My content" } }
	      @gossip.reload
	      expect(@gossip.title).to eq("My title")
	      expect(@gossip.content).to eq("My content")
	    end
	  
	    it "redirects to the updated gossip" do
	      put :update, params: { id: @gossip.id, "gossip" => { title: "My title", content: "My content" } }

	      # redirige où tu veux
	      expect(response).to redirect_to @gossip
	    end
	  end
	  
	  context "with invalid attributes" do
	    it "locates the requested @gossip" do
	    	#title lenght should be 3 to 50 char 
	      put :update, params: { id: @gossip.id, "gossip" => { title: "My", content: "My content" } }
	      expect(assigns(:gossip)).to eq(@gossip)      
	    end
	    
	    it "does not change @gossip's attributes" do
	      put :update, params: { id: @gossip.id, "gossip" => { title: "My", content: "My content" } }
	      @gossip.reload
	      expect(@gossip.title).not_to eq("My")
	      expect(@gossip.content).not_to eq("My content")
	    end
	    
	    it "re-renders the edit method" do
	      put :update, params: { id: @gossip.id, "gossip" => { title: "My", content: "My content" } }
	      expect(response).to render_template :edit
	    end
  	end
	end

	describe 'DELETE destroy' do
	  before :each do
	    @gossip = FactoryBot.create(:gossip)
	  end
  
	  it "deletes the gossip" do
	  	expect{delete :destroy, params: { id: @gossip.id}}.to change(Gossip,:count).by(-1)
	  end
	    
	  it "redirects to gossips#index" do
	    delete :destroy, params: { id: @gossip.id}
	    expect(response).to redirect_to root_path
	  end
	end
  
end
