require 'spec_helper'

describe ApplicationHelper do
  context "#link_to_switch_language" do
    context "when English" do
      before do
        expect(I18n).to receive(:locale) { :en }
        expect(request).to receive(:original_url) { "http://google.com" }
      end

      subject { link_to_switch_language }

      it { should match /Français/ }
      it { should match /chosen_language=fr/ }
    end

    context "when French" do
      before do
        expect(I18n).to receive(:locale) { :fr }
        expect(request).to receive(:original_url) { "http://google.com" }
      end

      subject { link_to_switch_language }

      it { should match /English/ }
      it { should match /chosen_language=en/ }
    end
  end
end
