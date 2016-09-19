Rails.application.config.after_initialize do
  Rails.logger = ActiveSupport::Logger.new(STDOUT)
  begin
    FileUtils.rm_rf(Rails.root.join('public/brands'))
    FileUtils.rm_rf(Rails.root.join('public/css'))
    FileUtils.rm_rf(Rails.root.join('public/img'))
    FileUtils.rm_rf(Rails.root.join('public/blog'))
    # make a spot for the site
    dest = Rails.root.join('public/static')

    # generate the site
    Jekyll::Site.new(
        Jekyll.configuration({
                                 "config" => Rails.root.join('config', 'jekyll.yml').to_s,
                                 "source" => Rails.root.join('blog').to_s,
                                 "destination" => dest.to_s
                             })
    ).process

    FileUtils.copy_entry dest, Rails.root.join('public')
    FileUtils.rm_rf(dest)
    # the strange codes give the output color
    Rails.logger.info "\e[0;32;49mJekyll site built!\e[0m]]"
  rescue => e
    Rails.logger.error "\e[0;31;49mJekyll site build failed.\e[0m\n\e[0;33;49mError:\e[0m #{e}"
  end
end