class QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]

    def index
        @quotes = current_company.quotes.ordered
    end

    def show
    end

    def new 
        @quote = Quote.new
    end

    def create
        @quote = current_company.quotes.build(quote_params)

        if @quote.save
            respond_to do |f|
                # determines how to respond based on the format used for requests, turbo_stream responds with the associated view
                f.html { redirect_to quotes_path, notice: "Quote was successfully created." }
                f.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @quote.update(quote_params)
            respond_to do |f|
                # determines how to respond based on the format used for requests, turbo_stream responds with the associated view
                f.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
                f.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @quote.destroy

        # determines how to respond based on the format used for requests
        respond_to do |f|
            f.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
            f.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
        end
    end

    private

    def set_quote
        @quote = current_company.quotes.find(params[:id])
    end

    def quote_params
        params.require(:quote).permit(:name)
    end
end
