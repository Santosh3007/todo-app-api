class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    def check_token
        @current_user = AuthorizeApiRequest.call(request.headers).result 
        if @current_user 
            render json: {message: "Authorized", user: @current_user}, status: :ok
        else
            render json: {error: 'Not Authorized' }, status: 401 unless @current_user
        end
    end

    private
    
    def authenticate_request 
        @current_user = AuthorizeApiRequest.call(request.headers).result 
        
        render json: {error: 'Not Authorized' }, status: 401 unless @current_user
    end

end
