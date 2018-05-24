class Admin::SubjectsController < Admin::BaseController
  before_action :check_admin
  before_action :find_branch_class
  before_action :find_subject, only: [:show, :edit, :update, :destroy]
  
  def index
    @subjects = @branch_class.subjects
  end

  def show

  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.branch_class_id = @branch_class.id
    if @subject.save
      flash[:notice] = "#{ @subject.title} Class Created Successfully"
      redirect_to admin_branch_class_subjects_path(@branch_class)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      flash[:notice] = "#{ @subject.title} Subject Update Successfully"
      redirect_to admin_subjects_path
    else
      render 'new'
    end
  end

  def destroy
    if @subject.destroy
      flash[:notice] = "#{ @subject.title} Subject Deleted Successfully"
    else
      flash[:alert] = "Unable to delete subject #{ @subject.title}"
    end
    admin_branch_class_subjects_path(@branch_class)
  end

  private

  def find_subject
    @subject = Subject.friendly.find(params[:id])
  end

  def find_branch_class
    @branch_class = current_user.branch.branch_classes.friendly.find(params[:branch_class_id])
  end

  def subject_params
    params.require(:subject).permit(:title)
  end
end
