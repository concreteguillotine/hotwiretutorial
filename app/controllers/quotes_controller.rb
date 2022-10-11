class QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]

    def index
        @quotes = Quote.ordered 
    end

    def show
    end

    def new 
        @quote = Quote.new
    end

    def create
        @quote = Quote.new(quote_params)

        if @quote.save
            respond_to do |f|
                # determines how to respond based on the format used for requests, turbo_stream responds with the associated view
                f.html { redirect_to quotes_path, notice: "Quote was successfully created." }
                f.turbo_stream
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @quote.update(quote_params)
            redirect_to quotes_path, notice: "Quote has successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @quote.destroy

        # determines how to respond based on the format used for requests
        respond_to do |f|
            f.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
            f.turbo_stream
        end
    end

    private

    def set_quote
        @quote = Quote.find(params[:id])
    end

    def quote_params
        params.require(:quote).permit(:name)
    end
end
