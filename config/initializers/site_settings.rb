# coding: utf-8

SITE = {
    title: "Juhász Ibolya gyógypedagógus",
    subtitle: "Perinatális Fejlődési és Nevelés-lélektani Szaktanácsadó",
    blogname: "Írások",
    background: "#e3e6cd",
    header_background: "url('/images/csepp.jpg') no-repeat top center",
    header_font: "#fff"
}

PAPERCLIP_OPTIONS = !Rails.env.production? ? {} : {
    :storage => :s3,
    :bucket => SITE['AWS_BUCKET'],
    :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
}