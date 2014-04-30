require 'spec_helper'

describe AttachmentsController do

  describe "GET 'new'" do
    it "returns http success" do
      answer = FactoryGirl.create(:answer)
      get :new, answer_id: answer.id

      response.should be_success
      assigns(:answer).should == answer
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      attachment = Attachment.create!
      post 'create', { 
        "url" => "https://adhesion-development.s3.amazonaws.com/uploads%2F1398818854408-1ielwar04hs62yb9-4989eaefddef575528e77c6220982c2f%2FScreen+Shot+2014-03-24+at+1.59.25+PM.png",
        "filepath" => "/uploads%2F1398818854408-1ielwar04hs62yb9-4989eaefddef575528e77c6220982c2f%2FScreen+Shot+2014-03-24+at+1.59.25+PM.png",
        "filename" => "Screen Shot 2014-03-24 at 1.59.25 PM.png",
        "filesize" => "6268",
        "lastModifiedDate" => "Mon Mar 24 2014 13:59:28 GMT-0400 (EDT)",
        "filetype" => "image/png",
        "unique_id" => "1ielwar04hs62yb9",
        "attachment" => {
          "attachment_url" => "https://adhesion-development.s3.amazonaws.com/uploads%2F1398818854408-1ielwar04hs62yb9-4989eaefddef575528e77c6220982c2f%2FScreen+Shot+2014-03-24+at+1.59.25+PM.png" },
        "id" => "#{attachment.id}"
      }

      response.should be_success

      assigns(:attachment).should_not be_nil
      assigns(:attachment).url.should == "https://adhesion-development.s3.amazonaws.com/uploads%2F1398818854408-1ielwar04hs62yb9-4989eaefddef575528e77c6220982c2f%2FScreen+Shot+2014-03-24+at+1.59.25+PM.png"
      assigns(:attachment).filename.should == "Screen Shot 2014-03-24 at 1.59.25 PM.png"
      assigns(:attachment).filepath.should == "/uploads%2F1398818854408-1ielwar04hs62yb9-4989eaefddef575528e77c6220982c2f%2FScreen+Shot+2014-03-24+at+1.59.25+PM.png"
      assigns(:attachment).filesize.should == "6268"
      assigns(:attachment).filetype.should == "image/png"
      
    end
  end

end
