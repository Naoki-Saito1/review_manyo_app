class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  def index
    
  #  @tasks =  current_user.tasks
  #  if params[:hoge]
  #    @tasks = current_user.tasks.sort_hoge
  #  elsif params[:sort_status]
  #    @tasks = current_user.tasks.sort_status
  #  elsif params[:sort_priority]
  #    @tasks = current_user.tasks.sort_priority
  #  end
    
  @tasks = current_user.tasks
  @tasks = @tasks.sort_hoge if params[:hoge]
  @tasks = @tasks.sort_status if params[:sort_status]
  @tasks = @tasks.sort_priority if params[:sort_priority]

  @tasks = @tasks.task_sort(params[:title]) if params[:title].present?
  @tasks = @tasks.status_sort(params[:status]) if params[:status].present?
  # binding.irb
  @tasks = @tasks.task_sort(params[:title]).status_sort(params[:status]) if params[:title].present? &&
  params[:status].present?
  # binding.irb
  # @tasks = @tasks.task_sort(params[:title]).status_sort(params[:status]) if params([:title]).present? && params[:status].present?
  
    # binding.irb
    # if params[:task].present?
    #   if params[:task][:title].present? && params[:task][:status].present?
    #     # params[:title]        @tasks = @tasks.task_sort(params[:task][:title]).status_sort(params[:task][:status])
    #   elsif params[:task][:title].present?
    #     @tasks = @tasks.task_sort(params[:task][:title])
    #   elsif params[:task][:status].present?
    #     @tasks = @tasks.status_sort(params[:task][:status])
    #   end
    # end
  end
  # (params[:task][:title])(params[:task][:status])
  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully cre." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :limit, :status, :priority, :user_id)
    end
end



# こうすることでuser.tasksといったメソッドで紐づくTaskオブジェクトの一覧を取得できます。Taskクラスのインスタンスはtask.userで紐づくUserオブジェクトを取得できます。
