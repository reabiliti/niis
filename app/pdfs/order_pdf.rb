class OrderPdf < Prawn::Document
  def initialize(certificate)
    super(margin: [0,0,0,0])
    @certificate = certificate
    bg_setup
    font_setup
    cer_number
  end

  def cer_number
    draw_text @certificate.cer_number, :at => [230,652], size: 12, style: :bold
    draw_text (@certificate.cer_validity_from).strftime("%d.%m.%Y"), :at => [315,630], size: 12, style: :bold
    draw_text (@certificate.cer_validity_to).strftime("%d.%m.%Y"), :at => [443,630], size: 12, style: :bold

    at_h = 519
    @certificate.cer_product_name.split("\r\n").each_with_index do |cpn, index|
      index == 0 ? (draw_text cpn, :at => [140, at_h], size: 12, style: :bold) : (draw_text cpn, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

    draw_text @certificate.cer_code_okp, :at => [480,490], size: 12, style: :bold
    draw_text @certificate.cer_code_tn_ved, :at => [480,410], size: 12, style: :bold

    at_h = 425
    @certificate.cer_regulation.split("\r\n").each do |creg|
      draw_text creg, :at => [59, at_h], size: 12, style: :bold
      at_h -= 12
    end

    at_h = 350
    @certificate.cer_manufacturer.split("\r\n").each_with_index do |cmnf, index|
      index == 0 ? (draw_text cmnf, :at => [159, at_h], size: 12, style: :bold) : (draw_text cmnf, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

  end

  def bg_setup
    bg = "public/pdf/cert_filled.jpg"
    image bg, at: [ 0, bounds.height ], width: bounds.width, height: bounds.height
  end

  def font_setup
    font_families.update("TimesNewRoman" => {
      :normal => "vendor/assets/fonts/TimesNewRomanRegular/TimesNewRomanRegular.ttf",
      :italic => "vendor/assets/fonts/TimesNewRomanItalic/TimesNewRomanItalic.ttf",
      :bold => "vendor/assets/fonts/TimesNewRomanBold/TimesNewRomanBold.ttf",
    })
    font "TimesNewRoman"
  end

end
