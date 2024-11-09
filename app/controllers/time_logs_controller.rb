class TimeLogsController < ApplicationController
  def create
    @time_log = current_user.time_logs.build(time_log_params)
    @time_log.check_in = Time.current

    if @time_log.save
      broadcast_time_update
      render json: { status: 'success', time_log: @time_log }
    else
      render json: { status: 'error', errors: @time_log.errors }, status: :unprocessable_entity
    end
  end

  def update
    @time_log = current_user.time_logs.find(params[:id])
    @time_log.check_out = Time.current

    if @time_log.save
      broadcast_time_update
      render json: { status: 'success', time_log: @time_log }
    else
      render json: { status: 'error', errors: @time_log.errors }, status: :unprocessable_entity
    end
  end

  private

  def time_log_params
    params.require(:time_log).permit(:shift_assignment_id)
  end

  def broadcast_time_update
    Turbo::StreamsChannel.broadcast_update_to(
      "time_logs_#{@time_log.shift_assignment_id}",
      target: "time_log_#{@time_log.id}",
      partial: "time_logs/time_log",
      locals: { time_log: @time_log }
    )
  end
end