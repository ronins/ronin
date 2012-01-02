require 'spec_helper'

describe ApplicationController do
  context "on #sitemap" do
    it "should cache the page" do
      clear_cache
      get :sitemap, :format => :xml
      File.exist?("#{CACHE_PATH}/sitemap.xml").should be_true
    end

    it "should assigns only published posts" do
      2.times.each { Factory :published_post }
      4.times.each { Factory :post }
      get :sitemap, :format => :xml
      assigns(:posts).count.should == 2
    end
  end
end
