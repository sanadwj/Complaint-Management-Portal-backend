module Api
  module V1
    class ComplaintsController < ApplicationController
      include CurrentUserConcern

      def index
        complaint = Complaint.all
        if complaint
          render json: {
            status: 200,
            complaint: complaint
          }
        else
          render json: { status: 500 }
        end
      end

      def create
        complaint = Complaint.create!(
          title: params['complaint']['title'],
          body: params['complaint']['body'],
          status: params['complaint']['status'],
          check_box: params['complaint']['check_box'],
          user_id: params['complaint']['user_id']
        )
        if complaint
          complaint.save
          render json: {
            status: 200,
            complaint: complaint
          }
        else
          render json: { status: 500 }
        end
      end

      def show
        complaint = Complaint.find_by(params[:user_id])
        if complaint
          render json: {
            status: 200,
            complaint: complaint,
            options: options
          }
        else
          render json: { status: 500 }
        end
      end

      def update
        complaint = Complaint.find_by(
          id: params[:id],
        )
        if complaint.update(
          status: params['complaint']['status']
        )
          render json: {
            status: 200,
            complaint: complaint,
          }
        else
          render json: { status: 500 }
        end
      end

      private

      def options
        @options ||= { include: @current_user }
      end
    end
  end
end
