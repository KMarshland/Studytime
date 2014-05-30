class StudygroupsController < ApplicationController
  before_action :set_studygroup, only: [:show, :edit, :update, :destroy]
  before_filter :check_logged_in
  before_filter :check_authorization_level, only: [:edit, :update, :destroy]

  helper_method :is_host_of

  # GET /studygroups
  # GET /studygroups.json
  def index

    current_url = request.original_url.to_s
    regexp = /#\s*$/
    if (current_url.match(regexp)).nil?
      #redirect_to current_url << '#'
    end

    @studygroups = Studygroup.all
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    @studygroups.each do |studygroup|
      unless studygroup.valid? && studygroup.is_in_future
        @studygroups -= [studygroup]
      end
    end

    @studygroups.sort_by! {|obj| obj.when  unless obj.blank?}

    @joined_study_groups = []
    @unjoined_study_groups = []

    @studygroups.each do |studygroup|
      if studygroup.users.include?(@current_user) || @current_user.id == studygroup.host_id
        @joined_study_groups.append(studygroup)
      elsif
        @unjoined_study_groups.append(studygroup)
      end
    end

    @hash = Gmaps4rails.build_markers(@studygroups) do |studygroup, marker|
      marker.lat studygroup.latitude
      marker.lng studygroup.longitude
      marker.infowindow  studygroup.strftime
    end

  end

  def join_group
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    @studygroup = Studygroup.find(params[:id])
    if !@studygroup.users.include?(@current_user)
      @studygroup.users << @current_user
    end

    redirect_to studygroups_path
  end

  def leave_group
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    @studygroup = Studygroup.find(params[:id])
    if @studygroup.users.include?(@current_user)
      @studygroup.users.delete(@current_user)
    end

    redirect_to studygroups_path
  end

  # GET /studygroups/1
  # GET /studygroups/1.json
  def show

    unless @studygroup.valid?
      redirect_to studygroups_path
    end

    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    @is_host = @current_user.id == @studygroup.host_id
    @has_joined_group = @studygroup.users.include?(@current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @studygroup }
    end
  end

  # GET /studygroups/new
  def new
    @studygroup = Studygroup.new
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @studygroup.update_attribute(:host_id, @current_user.id)
    @studygroup.update_attribute(:daysFromNow, 0)
    @studygroup.update_attribute(:todaysDate, Date.today.in_time_zone)
    @studygroup.update_attribute(:when, Time.zone.now)
    @studygroup.update_attribute(:duration, 1)

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @studygroup }
    end
  end


  # GET /studygroups/1/edit
  def edit
  end

  # POST /studygroups
  # POST /studygroups.json
  def create
    @studygroup = Studygroup.new(studygroup_params)

    respond_to do |format|
      if @studygroup.save
        format.html { redirect_to studygroups_path, notice: 'Studygroup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @studygroup }
      else
        format.html { render action: 'new' }
        format.json { render json: @studygroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studygroups/1
  # PATCH/PUT /studygroups/1.json
  def update
    respond_to do |format|
      if @studygroup.update(studygroup_params)
        format.html { redirect_to studygroups_path, notice: 'Studygroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @studygroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studygroups/1
  # DELETE /studygroups/1.json
  def destroy
    @studygroup.destroy
    respond_to do |format|
      format.html { redirect_to studygroups_url }
      format.json { head :no_content }
    end
  end

  def is_host_of(studygroup)
     @current_user.id == studygroup.host_id
  end

  def check_authorization_level
    unless is_admin?
      @studygroup = Studygroup.find(params[:id])
      @is_host = @current_user.id == @studygroup.host_id

      unless @is_host
        redirect_to studygroup_path
        false
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studygroup
      @studygroup = Studygroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studygroup_params
      params.require(:studygroup).permit(:when, :where, :websiteLink, :duration)
    end
end
