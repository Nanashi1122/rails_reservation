class ResevationsController < ApplicationController
    def home
    end

    def new
        
        @resevation = Resevation.new 
    end
end
