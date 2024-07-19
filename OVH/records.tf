
resource "ovh_domain_zone_record" "pumpkin" {
    zone = data.ovh_domain_zone.crichard_fr.name
    subdomain = "pumpkin"
    fieldtype = "A"
    target = "5.39.81.146"
}


resource "ovh_domain_zone_record" "_dmarc" {
    zone = data.ovh_domain_zone.crichard_fr.name
    subdomain = "_dmarc"
    fieldtype = "DMARC"
    target = "v=DMARC1;p=none;rua=mailto:cesar@crichard.fr;sp=none;aspf=r;"
}

resource "ovh_domain_zone_record" "sshfp" {
    zone = data.ovh_domain_zone.crichard_fr.name
    subdomain = ""
    fieldtype = "SSHFP"
    target = "1 2 f318f009eed8885ca5ad079f88c60227f3fb9fdfca4e3d67e2c2058e23b5f26b"
}

resource "ovh_domain_zone_record" "spf" {
    zone = data.ovh_domain_zone.crichard_fr.name
    subdomain = ""
    fieldtype = "SPF"
    target = "v=spf1 include:mx.ovh.com ~all"
}

resource "ovh_domain_zone_record" "mx1" {
    zone = data.ovh_domain_zone.crichard_fr.name
    subdomain = ""
    fieldtype = "MX"
    target = "1 mx1.mail.ovh.net."
}

resource "ovh_domain_zone_record" "mx2" {
    zone = data.ovh_domain_zone.crichard_fr.name
    subdomain = ""
    fieldtype = "MX"
    target = "5 mx2.mail.ovh.net."
}

resource "ovh_domain_zone_record" "mx3" {
    zone = data.ovh_domain_zone.crichard_fr.name
    subdomain = ""
    fieldtype = "MX"
    target = "100 mx3.mail.ovh.net."
}
