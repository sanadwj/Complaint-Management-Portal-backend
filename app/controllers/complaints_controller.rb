class ComplaintsController < ApplicationController
  include CurrentUserConcern
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
end
