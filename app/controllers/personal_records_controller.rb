class PersonalRecordsController < ApplicationController
  # display list of all personal records associated with user
  def index
    @title = 'Personal Records'
    @personal_records = PersonalRecord.get_all_records_for(current_user.id)
  end

  # show the personal record
  def show
    @title = 'Personal Record'
    @personal_record = current_user.personal_records.find_by_id(params[:id])
    unless @personal_record
      flash[:error] = 'You are not permitted to access this record'
      redirect_to :action => 'index'
      return
    end
  end
end
