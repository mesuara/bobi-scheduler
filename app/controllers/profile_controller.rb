class ProfileController < ApplicationController
    before_action :set_profile, only: [:index, :new, :create]
    def index
      if @profile
        @appointment = @profile.appointments.order 'created_at desc'
      end

    end
  
    def new
    end
  
    
  
    private
      def set_profile
        @profile = User.find_by(name: params[:profile])
      end
  
   
  end