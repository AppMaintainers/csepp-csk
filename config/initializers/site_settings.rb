# coding: utf-8

SITE = {
    title: "Juhász Ibolya gyógypedagógus",
    subtitle: "Perinatális Fejlődési és Nevelés-lélektani Szaktanácsadó",
    blogname: "Írások",
    background: "#e3e6cd",
    header_background: "url('/images/csepp.jpg') no-repeat top center",
    header_font: "#fff"
}

CarrierWave.configure do |config|
  config.storage = :grid_fs
end