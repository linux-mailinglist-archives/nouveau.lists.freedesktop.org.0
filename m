Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00330BE5A9
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2019 21:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C726F535;
	Wed, 25 Sep 2019 19:30:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D5F6F51E
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2019 19:30:11 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id p23so14872yba.3
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2019 12:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ivc5Ob9PVZJplSHL+R/D0C0HT53Yohnme4bjjvTUjS4=;
 b=n/i7I6nj4V7A1jr3xgKJZtiK/qCsPF4UQe/mblxCCh0Y15BF+0Vw04iITLR7O27z/w
 qIYosz5hmsR22sPKwGobDLdMt7CQ9EyCFBSHaH2xbnxgsWJPHHE5LonKw9Q/oA5bkLA3
 isfQibfjt9n+n1udUOTTXZ+j7nprKwJpj1sHnb4ZcTwPn1Ae6ZUcl0UF80enfEqPePzl
 o2Z7KUO+3fp82yXGYizEP+PTWi0QKfrOGByZiMVwd6kL3DxgORvLtmDxw0SUwX4ZGNxB
 O5mCzQkqjrbkC8ee6OQhDzDUAA8hN4j2kikzvB3QATAY4Jirk6k7ibZdUvmA1cJMuoNf
 Zkwg==
X-Gm-Message-State: APjAAAWWPWR2+DNC4kAAXPuFOu3waBXB0uwWGWGdI/EFVSz+j9IBt3LS
 gSh4DwuIgUPCKRFWaTaYC2AhhQ==
X-Google-Smtp-Source: APXvYqxfifPqZv+UdJYFkxbD5nMkRDaBiqNMCGCRMwi6mlVj2WtuUyOtxRzyV2anpOAEVqc+3QH5YQ==
X-Received: by 2002:a25:70d6:: with SMTP id l205mr4296329ybc.374.1569439810639; 
 Wed, 25 Sep 2019 12:30:10 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id l188sm1414583ywl.29.2019.09.25.12.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 12:30:10 -0700 (PDT)
Date: Wed, 25 Sep 2019 15:30:09 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20190925193009.GI218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-18-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-18-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ivc5Ob9PVZJplSHL+R/D0C0HT53Yohnme4bjjvTUjS4=;
 b=cj6dBN+XZAqEN5fpheUDPARCVOb+gJLpNiyxUsf4DQRqLidgm5jPfRbpsGjgigMEli
 sKdO5aSG4Ju4tuB3UYgi0aATUqk5Bu67pbZKVqe9Ku/eUnzWiJHP3zqbhVaXcaKAZduk
 ElE1fpYM2ZC4glzLx2LMTD1SOI2ni89e/+j18VcfeQ4iNIjf0sxLJK1oGuaC+RXHJSF0
 jx8MGCSOuNNzWV1/n0h057nYEVhTyyraJ15FF61aeZxm7hDnN2q+4Ivj+pqu6XR+eG7R
 qx44BkWTDjS88F34WHOsnQ7OOSFNO9ZP2J8IDkDKcAF7+AYl3vfJGrLf3lmpXtkVljxa
 H7BQ==
Subject: Re: [Nouveau] [PATCH v2 17/27] drm/dp_mst: Rename drm_dp_add_port
 and drm_dp_update_port
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <hwentlan@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6NTVQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGUgbmFtZXMgZm9yIHRoZXNlIGZ1bmN0aW9ucyBhcmUgcmF0aGVyIGNvbmZ1c2luZy4g
ZHJtX2RwX2FkZF9wb3J0KCkKPiBzb3VuZHMgbGlrZSBhIGZ1bmN0aW9uIHRoYXQgd291bGQgc2lt
cGx5IGNyZWF0ZSBhIHBvcnQgYW5kIGFkZCBpdCB0byBhCj4gdG9wb2xvZ3ksIGFuZCBkbyBub3Ro
aW5nIG1vcmUuIFNpbWlsYXJseSwgZHJtX2RwX3VwZGF0ZV9wb3J0KCkgd291bGQgYmUKPiBhc3N1
bWVkIHRvIGJlIHRoZSBmdW5jdGlvbiB0aGF0IHNob3VsZCBiZSB1c2VkIHRvIHVwZGF0ZSBwb3J0
Cj4gaW5mb3JtYXRpb24gYWZ0ZXIgaW5pdGlhbCBjcmVhdGlvbi4KPiAKPiBXaGlsZSB0aG9zZSBh
c3N1bXB0aW9ucyBhcmUgY3VycmVudGx5IGNvcnJlY3QgaW4gaG93IHRoZXNlIGZ1bmN0aW9ucyBh
cmUKPiB1c2VkLCBhIHF1aWNrIGdsYW5jZSBhdCBkcm1fZHBfYWRkX3BvcnQoKSByZXZlYWxzIHRo
YXQgZHJtX2RwX2FkZF9wb3J0KCkKPiBjYW4gYWxzbyB1cGRhdGUgdGhlIGluZm9ybWF0aW9uIG9u
IGEgcG9ydCwgYW5kIHNlZW1zIGV4cGxpY2l0bHkgZGVzaWduZWQKPiB0byBkbyBzby4gVGhpcyBj
YW4gYmUgZXhwbGFpbmVkIHByZXR0eSBzaW1wbHkgYnkgdGhlIGZhY3QgdGhhdCB0aGVyZSdzCj4g
bW9yZSBzaXR1YXRpb25zIHRoYXQgd291bGQgaW52b2x2ZSB1cGRhdGluZyB0aGUgcG9ydCBpbmZv
cm1hdGlvbiBiYXNlZAo+IG9uIGEgbGluayBhZGRyZXNzIHJlc3BvbnNlIGFzIG9wcG9zZWQgdG8g
YSBjb25uZWN0aW9uIHN0YXR1cwo+IG5vdGlmaWNhdGlvbiB0aGFuIHRoZSBkcml2ZXIncyBpbml0
aWFsIHRvcG9sb2d5IHByb2JlLiBDYXNlIGluIHBvaW50Ogo+IHJlcHJvYmluZyBsaW5rIGFkZHJl
c3NlcyBhZnRlciBzdXNwZW5kL3Jlc3VtZS4KPiAKPiBTaW5jZSB3ZSdyZSBhYm91dCB0byBzdGFy
dCB1c2luZyBkcm1fZHBfYWRkX3BvcnQoKSBkaWZmZXJlbnRseSBmb3IKPiBzdXNwZW5kL3Jlc3Vt
ZSByZXByb2JpbmcsIGxldCdzIHJlbmFtZSBib3RoIGZ1bmN0aW9ucyB0byBjbGFyaWZ5IHdoYXQK
PiB0aGV5IGFjdHVhbGx5IGRvLgo+IAo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5j
b20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2VudGxh
bmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
ClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxNyArKysrKysrKysrLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCA5OTQ0ZWYyY2U4ODUuLmNm
YWY5ZWI3YWNlOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBA
IC0xOTAwLDkgKzE5MDAsMTAgQEAgdm9pZCBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJl
Z2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gIH0KPiAgRVhQT1JUX1NZ
TUJPTChkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKTsKPiAgCj4gLXN0YXRp
YyB2b2lkIGRybV9kcF9hZGRfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCj4g
LQkJCSAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+IC0JCQkgICAgc3RydWN0IGRybV9kcF9s
aW5rX2FkZHJfcmVwbHlfcG9ydCAqcG9ydF9tc2cpCj4gK3N0YXRpYyB2b2lkCj4gK2RybV9kcF9t
c3RfaGFuZGxlX2xpbmtfYWRkcmVzc19wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0
YiwKPiArCQkJCSAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICsJCQkJICAgIHN0cnVjdCBk
cm1fZHBfbGlua19hZGRyX3JlcGx5X3BvcnQgKnBvcnRfbXNnKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJt
X2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciA9IG1zdGItPm1ncjsKPiAgCXN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKnBvcnQ7Cj4gQEAgLTIwMTEsOCArMjAxMiw5IEBAIHN0YXRpYyB2b2lkIGRybV9k
cF9hZGRfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCj4gIAlkcm1fZHBfbXN0
X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBkcm1fZHBf
dXBkYXRlX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAo+IC0JCQkgICAgICAg
c3RydWN0IGRybV9kcF9jb25uZWN0aW9uX3N0YXR1c19ub3RpZnkgKmNvbm5fc3RhdCkKPiArc3Rh
dGljIHZvaWQKPiArZHJtX2RwX21zdF9oYW5kbGVfY29ubl9zdGF0KHN0cnVjdCBkcm1fZHBfbXN0
X2JyYW5jaCAqbXN0YiwKPiArCQkJICAgIHN0cnVjdCBkcm1fZHBfY29ubmVjdGlvbl9zdGF0dXNf
bm90aWZ5ICpjb25uX3N0YXQpCj4gIHsKPiAgCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7
Cj4gIAlpbnQgb2xkX2RkcHM7Cj4gQEAgLTI0NjQsNyArMjQ2Niw4IEBAIHN0YXRpYyB2b2lkIGRy
bV9kcF9zZW5kX2xpbmtfYWRkcmVzcyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
ciwKPiAgCWRybV9kcF9jaGVja19tc3RiX2d1aWQobXN0YiwgcmVwbHktPmd1aWQpOwo+ICAKPiAg
CWZvciAoaSA9IDA7IGkgPCByZXBseS0+bnBvcnRzOyBpKyspCj4gLQkJZHJtX2RwX2FkZF9wb3J0
KG1zdGIsIG1nci0+ZGV2LCAmcmVwbHktPnBvcnRzW2ldKTsKPiArCQlkcm1fZHBfbXN0X2hhbmRs
ZV9saW5rX2FkZHJlc3NfcG9ydChtc3RiLCBtZ3ItPmRldiwKPiArCQkJCQkJICAgICZyZXBseS0+
cG9ydHNbaV0pOwo+ICAKPiAgCWRybV9rbXNfaGVscGVyX2hvdHBsdWdfZXZlbnQobWdyLT5kZXYp
Owo+ICAKPiBAQCAtMzMyNCw3ICszMzI3LDcgQEAgc3RhdGljIGludCBkcm1fZHBfbXN0X2hhbmRs
ZV91cF9yZXEoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCj4gIAl9Cj4gIAo+
ICAJaWYgKG1zZy5yZXFfdHlwZSA9PSBEUF9DT05ORUNUSU9OX1NUQVRVU19OT1RJRlkpIHsKPiAt
CQlkcm1fZHBfdXBkYXRlX3BvcnQobXN0YiwgJm1zZy51LmNvbm5fc3RhdCk7Cj4gKwkJZHJtX2Rw
X21zdF9oYW5kbGVfY29ubl9zdGF0KG1zdGIsICZtc2cudS5jb25uX3N0YXQpOwo+ICAKPiAgCQlE
Uk1fREVCVUdfS01TKCJHb3QgQ1NOOiBwbjogJWQgbGRwczolZCBkZHBzOiAlZCBtY3M6ICVkIGlw
OiAlZCBwZHQ6ICVkXG4iLAo+ICAJCQkgICAgICBtc2cudS5jb25uX3N0YXQucG9ydF9udW1iZXIs
Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29v
Z2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
