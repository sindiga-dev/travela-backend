class PassengersController < ApplicationController

def create 
    passenger = Passenger.create(passenger_params)
    if passenger.valid?
        render json: passenger, status: :created
    else 
        render json: {errors: passenger.errors.full_messages}, status: :unprocessable_entity
    end 
end 

def show
  user = Passenger.find(session[:passenger_id])
  if user 
    render json: user
  else
    render json: {error: "Not authorized"}, status: :unauthorized
  end
end


private 
def passenger_params
    params.permit(:username, :password, :email, :p_number, :s
    )
end
def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :passenger_id
  end


end
