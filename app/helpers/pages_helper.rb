module PagesHelper
  # Mods page
  def writeModPage(mod)
    %{
    <div class="mod">
      <a href="#{mod.webpage}" target="_blank">
        <div class="row">
          <div class="col-md-2">
            <img src="#{mod.logo}" alt="#{mod.name}_logo" class="responsive-img" />
          </div>
          <div class="col-md-10">
            <h2>#{mod.name}</h2>
            #{mod.desc}
          </div>
        </div>
      </a>
    </div>
    }
  end

  # Resume related
  def writeJobDesc(title, company, website, location, dates, desc)
    %{
    <div class="row">
      <div class="job-title">
        <p>#{title}</p>
        <p>#{link_to company, website, target: '_blank'}, #{location}</p>
        <p>#{dates}</p>
      </div>
      <p class="job-desc">&emsp;#{desc}</p>
    </div>
    }.html_safe
  end

end
