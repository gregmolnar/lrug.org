pages = sitemap.where(:slug => 'meetings').first.children
xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://blog.url.com/"
  xml.title "Article RSS Feed"
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.description "LRUG.org London Ruby User Group : Meetings"
  xml.updated(pages.first.metadata[:page]['updated_at'].to_time.iso8601) unless pages.empty?
end