class HealthRecordsController < ApplicationController
  # display list of all health records for a user
  def index
    @records = current_user.health_records
  end

  # return an HTML form to add a health record
  def new
    @record = HealthRecord.new
  end

  # create a new health record
  def create
    @record = HealthRecord.new(params[:health_record])
    if @record.save
      current_user.health_records << @record
      redirect_to :action => 'show', :id => @record.id
    else
      flash[:error] = 'There was a problem saving your health record'
      flash[:errors] = @record.errors
      redirect_to :action => 'new'
    end
  end

  # display a specific health record
  def show
    # only select from records that are associated with current user
    @record = current_user.health_records.find_by_id(params[:id])
    unless @record
      flash[:error] = "The selected health record doesn't belong to you"
      redirect_to :action => 'index'
    end
  end

  # return a form to edit a health record
  def edit
    # only select from records that are associated with current user
    @record = current_user.health_records.find_by_id(params[:id])
    unless @record
      flash[:error] = "The selected health record doesn't belong to you"
      redirect_to :action => 'index'
    end
  end

  # update a specific health record
  def update
    # only select from records that are associated with current user
    @record = current_user.health_records.find_by_id(params[:id])
    unless @record
      flash[:error] = "The selected health record doesn't belong to you"
      redirect_to :action => 'index'
    end
    if @record.update_attributes(params[:health_record])
      flash[:notice] = 'Edit was successful'
      redirect_to :action => 'show', :id => @record.id
    else
      flash[:error] = "Your health record didn't update properly"
      flash[:errors] = @record.errors
      redirect_to :action => 'edit', :id => @record.id
    end
  end

  # delete a specific health record
  def destroy
    # only select from records that are associated with current user
    @record = current_user.health_records.find_by_id(params[:id])
    @record.destroy
    redirect_to :action => 'index'
  end
end
