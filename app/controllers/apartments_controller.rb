class ApartmentsController < ApplicationController
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        render json: Apartment.all
    end

    def show
        apartment = find_apartment
        render json: apartment
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = find_apartment
        instructor.update(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = find_apartment
        instructor.destroy
        head :no_content
    end

    private

    def find_apartment
        Apartment.find_by(params[:id])
    end

    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
    end

    def apartment_params
        params.permit(:number)
    end
end
