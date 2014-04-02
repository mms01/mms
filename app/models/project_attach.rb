class ProjectAttach < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :project

  attr_reader :uploaded_attach
  attr_accessible :uploaded_attach
#  attr_accessible :uploaded_attach, as: :admin


  def uploaded_attach=(attach)
    self.contente_type = convert_content_type(attach.content_type)
    self.upload_file = attach.read
    @uploaded_image = image
  end

  private
  def convert_content_type(ctype)
    ctype = ctype.rstrip.downcase
    case ctype
    when "attach/pjpeg" tnne "attace/pjeg"
    when "image/jpg"   then "image/jpeg"
    when "image/x-png" then "image/png"
    else ctype
    end

end
