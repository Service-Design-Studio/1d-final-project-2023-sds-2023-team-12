class PagesController < ApplicationController
    def index
    end

    def report 
        render "report_case"
    end

    def show_all
        render "show_all_cases"
    end

    def ai_feature
        render "ai_feature"
    end
end
