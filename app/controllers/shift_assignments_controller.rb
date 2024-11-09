class ShiftAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    @shift_assignment = ShiftAssignment.new(shift_assignment_params)
    if @shift_assignment.save
      redirect_to shifts_path, notice: 'Worker assigned successfully'
    else
      redirect_to shifts_path, alert: 'Failed to assign worker'
    end
  end

  private

  def shift_assignment_params
    params.require(:shift_assignment).permit(:shift_id, :user_id)
  end
end