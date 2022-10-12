class PagesController < ApplicationController
    skin_before_action :authenticate_user!

    def home
    end
end
