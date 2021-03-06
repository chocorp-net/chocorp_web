# frozen_string_literal: true

module PagesHelper
  # Mods page
  def write_mod_page(mod)
    %(
    <div class="mod">
      <a href="#{mod.webpage}" target="_blank">
        <div class="row">
          <div class="col-md-2 flex-center">
            <img src="#{mod.logo}" alt="#{mod.name}_logo" class="responsive-img" />
          </div>
          <div class="col-md-10 mod-desc">
            <h2>#{mod.name}</h2>
            <span>#{mod.desc}</span>
          </div>
        </div>
      </a>
    </div>
    ).html_safe
  end

  # Resume related
  def write_job_desc(title, company, website, location, dates, desc)
    %(
    <div class="row">
      <div class="job-title">
        <p>#{title}</p>
        <p>#{link_to company, website, target: '_blank', rel: 'noopener'}, #{location}</p>
        <p>#{dates}</p>
      </div>
      <p class="job-desc">&emsp;#{desc}</p>
    </div>
    ).html_safe
  end
end
