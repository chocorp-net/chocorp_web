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
end
