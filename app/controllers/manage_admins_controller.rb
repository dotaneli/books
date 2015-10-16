class ManageAdminsController < AdminController
  def index
    @admins = Admin.all
  end
end
