module CertificationsHelper
  def file_icon_image_path(file_name)
    extension = file_name.split(".").last.to_sym
    extension = :doc unless %i(doc html ics jpg mov mp3 pdf ppt rar xls zip).include? extension

    "file_icons/#{extension}.png"
  end
end
