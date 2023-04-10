class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create!(assignment_params)
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to root_path, notice: "Thanks for your Submission, We will contact you soon" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :description, :file).merge(user_id: current_user.id)
  end
end
