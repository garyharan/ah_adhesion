require 'spec_helper'

describe DossiersHelper do
  it "creates an image tag" do
    file_icon_image_path("image.png").should == 'file_icons/doc.png'
  end

  it "default to doc.png if no extension" do
    file_icon_image_path("image.png").should =~ /doc\.png/
  end
end
