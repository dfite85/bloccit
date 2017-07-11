require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do                          
    describe "GET index" do                                                     #describes the subject of the spec
        it "renders the index template" do
            get :index                                                          #uses get to call the index method of welcomeController
            expect(response).to render_template("index")                        #expects the controllers response to render the index template
        end
    end
    
    describe "GET about" do                                                     #describes the subject of the spec
        it "renders the about template" do                                     
            get :about                                                          #uses get to call the about method of welcomeController
            expect(response).to render_template("about")                        #expects the controllers response to render the About template
        end
    end
end
