Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD165E0D23
	for <lists+nouveau@lfdr.de>; Tue, 22 Oct 2019 22:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC616E904;
	Tue, 22 Oct 2019 20:14:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F196E902
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 20:14:37 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id t4so5578716ybk.3
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 13:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=uWT/91UjYG+pRZcitLYG0hQ77Zt8GLqkiDgF5fsNM4I=;
 b=O9KLfJVvb3MHq6JIezBDyAKDo4c/uThzlQoXvDzbWgtLHK9FX+uivu/AGQQmBdEUsJ
 P97scz6XBGNWeLINdB7HDpOWgqDjuAe0BB9xLLSem1sk2hvy/TJsN6qmvvqkwHzkGEUX
 SqdK6lnEuaLY4DjAdqYEjjweoDIbKFwDLzslKlOV1mtIvc0Vx0Mx1ZzcNP+Qf7BwnCvT
 8KRShycfivBpKXvhRCMAxBKgYy/xaYcJRdxhgX+wnWtWQSDDUuvN5hDsI+BFmjofafEW
 jwIhq07v+XhNGsRRaBaznKsNcVtCxhXTmJRH9WAmgVBLGg3ifaRJ1t2G1h9tdI+kf57i
 Wnpg==
X-Gm-Message-State: APjAAAXACyjvRHPVi+RTNIoneS4Missw64Or1jcaRjKOlPmxwPLlm7Hv
 WoJRBvuY1qd/7jvpkX7cUUHrzQ==
X-Google-Smtp-Source: APXvYqy06XHilaVYrRwLLXfjBU+UN5aAupBO2I09ze4erbjNF8BXYcvlr5hw8S/sn5n/QlrJtYmJ+A==
X-Received: by 2002:a25:77ce:: with SMTP id s197mr3799322ybc.228.1571775276083; 
 Tue, 22 Oct 2019 13:14:36 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d191sm210244ywd.71.2019.10.22.13.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 13:14:35 -0700 (PDT)
Date: Tue, 22 Oct 2019 16:14:35 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20191022201435.GD212858@art_vandelay>
References: <20191022023641.8026-1-lyude@redhat.com>
 <20191022023641.8026-8-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022023641.8026-8-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=uWT/91UjYG+pRZcitLYG0hQ77Zt8GLqkiDgF5fsNM4I=;
 b=Vpzqcwbm24NKQ2QXaeqLT9/Ve60BsfofS5RLmhJdZTxTjUvjY/jAw5mWfeiskCTnoh
 GxSWZWW+83K3fdZoJxz7bgcBm/RjZYUsmcj998XrFrep4sOc0W3cKMPkmvlf5AMYSk9i
 sx+x7Ot9QNU1Flr+6zsZw34aXN7XCMDADD2F2W+uTtkHcL/YCL2hZ914FWAfRO7+yVeM
 VJZjXoTgNXB1OY4bo1PQDjjSGMJc7mMEDaZqRsRq9BYer+yArpitWdgE3bypKHWKYk22
 X7h3nDHBpb51BFX9pWuieF/3BfcHQhp4bu7QF54TrhC13zI9Gev1Rq94OVslw0lAOd2o
 n5Mw==
Subject: Re: [Nouveau] [PATCH v5 07/14] drm/dp_mst: Don't forget to update
 port->input in drm_dp_mst_handle_conn_stat()
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <hwentlan@amd.com>, Imre Deak <imre.deak@intel.com>,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTA6MzY6MDJQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGlzIHByb2JhYmx5IGhhc24ndCBjYXVzZWQgYW55IHByb2JsZW1zIHVwIHVudGlsIG5v
dyBzaW5jZSBpdCdzCj4gcHJvYmFibHkgbmVhcmx5IGltcG9zc2libGUgdG8gZW5jb3VudGVyIHRo
aXMgaW4gdGhlIHdpbGQsIGhvd2V2ZXIgaWYgd2UKPiB3ZXJlIHRvIHJlY2VpdmUgYSBjb25uZWN0
aW9uIHN0YXR1cyBub3RpZmljYXRpb24gZnJvbSB0aGUgTVNUIGh1YiBhZnRlcgo+IHJlc3VtZSB3
aGlsZSB3ZSdyZSBpbiB0aGUgbWlkZGxlIG9mIHJlcHJvYmluZyB0aGUgbGluayBhZGRyZXNzZXMg
Zm9yIGEKPiB0b3BvbG9neSB0aGVuIHRoZXJlJ3MgYSBtdWNoIGxhcmdlciBjaGFuY2UgdGhhdCBh
IHBvcnQgY291bGQgaGF2ZQo+IGNoYW5nZWQgZnJvbSBiZWluZyBhbiBvdXRwdXQgcG9ydCB0byBp
bnB1dCBwb3J0IChvciB2aWNlIHZlcnNhKS4gSWYgd2UKPiBmb3JnZXQgdG8gdXBkYXRlIHRoaXMg
Yml0IG9mIGluZm9ybWF0aW9uLCB3ZSdsbCBwb3RlbnRpYWxseSBpZ25vcmUgYQo+IHZhbGlkIFBE
VCBjaGFuZ2Ugb24gYSBkb3duc3RyZWFtIHBvcnQgYmVjYXVzZSB3ZSB0aGluayBpdCdzIGFuIGlu
cHV0Cj4gcG9ydC4KPiAKPiBTbywgbWFrZSBzdXJlIHdlIHJlYWQgdGhlIGlucHV0X3BvcnQgZmll
bGQgaW4gY29ubmVjdGlvbiBzdGF0dXMKPiBub3RpZmljYXRpb25zIGluIGRybV9kcF9tc3RfaGFu
ZGxlX2Nvbm5fc3RhdCgpIHRvIHByZXZlbnQgdGhpcyBmcm9tCj4gaGFwcGVuaW5nIG9uY2Ugd2Un
dmUgaW1wbGVtZW50ZWQgc3VzcGVuZC9yZXN1bWUgcmVwcm9iaW5nLgo+IAo+IENjOiBKdXN0b24g
TGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVs
LmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA1
MiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwo+IGluZGV4IDdiZjRkYjkxZmY5MC4uYzhlMjE4YjkwMmFlIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTIwNzksMTggKzIwNzksNDAgQEAgZHJt
X2RwX21zdF9oYW5kbGVfY29ubl9zdGF0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwK
PiAgewo+ICAJc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IgPSBtc3RiLT5tZ3I7
Cj4gIAlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0Owo+IC0JaW50IG9sZF9kZHBzOwo+IC0J
Ym9vbCBkb3dvcmsgPSBmYWxzZTsKPiArCWludCBvbGRfZGRwcywgcmV0Owo+ICsJdTggbmV3X3Bk
dDsKPiArCWJvb2wgZG93b3JrID0gZmFsc2UsIGNyZWF0ZV9jb25uZWN0b3IgPSBmYWxzZTsKPiAg
Cj4gIAlwb3J0ID0gZHJtX2RwX2dldF9wb3J0KG1zdGIsIGNvbm5fc3RhdC0+cG9ydF9udW1iZXIp
Owo+ICAJaWYgKCFwb3J0KQo+ICAJCXJldHVybjsKPiAgCj4gLQkvKiBMb2NraW5nIGlzIG9ubHkg
bmVlZGVkIGlmIHRoZSBwb3J0J3MgZXhwb3NlZCB0byB1c2Vyc3BhY2UgKi8KPiAtCWlmIChwb3J0
LT5jb25uZWN0b3IpCj4gKwlpZiAocG9ydC0+Y29ubmVjdG9yKSB7Cj4gKwkJaWYgKCFwb3J0LT5p
bnB1dCAmJiBjb25uX3N0YXQtPmlucHV0X3BvcnQpIHsKPiArCQkJLyoKPiArCQkJICogV2UgY2Fu
J3QgcmVtb3ZlIGEgY29ubmVjdG9yIGZyb20gYW4gYWxyZWFkeSBleHBvc2VkCj4gKwkJCSAqIHBv
cnQsIHNvIGp1c3QgdGhyb3cgdGhlIHBvcnQgb3V0IGFuZCBtYWtlIHN1cmUgd2UKPiArCQkJICog
cmVwcm9iZSB0aGUgbGluayBhZGRyZXNzIG9mIGl0J3MgcGFyZW50IE1TVEIKPiArCQkJICovCj4g
KwkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfdW5saW5rX3BvcnQobWdyLCBwb3J0KTsKPiArCQkJbXN0
Yi0+bGlua19hZGRyZXNzX3NlbnQgPSBmYWxzZTsKPiArCQkJZG93b3JrID0gdHJ1ZTsKPiArCQkJ
Z290byBvdXQ7Cj4gKwkJfQo+ICsKPiArCQkvKgo+ICsJCSAqIExvY2tpbmcgaXMgb25seSBuZWVk
ZWQgaWYgdGhlIHBvcnQncyBleHBvc2VkIHRvIHVzZXJzcGFjZQo+ICsJCSAqLwoKb3B0aW9uYWwg
bml0OiB0aGlzIHdpbGwgc3RpbGwgZml0IG9uIG9uZSBsaW5lCgo+ICAJCWRybV9tb2Rlc2V0X2xv
Y2soJm1nci0+YmFzZS5sb2NrLCBOVUxMKTsKPiArCX0gZWxzZSBpZiAocG9ydC0+aW5wdXQgJiYg
IWNvbm5fc3RhdC0+aW5wdXRfcG9ydCkgewo+ICsJCWNyZWF0ZV9jb25uZWN0b3IgPSB0cnVlOwo+
ICsJCS8qIFJlcHJvYmUgbGluayBhZGRyZXNzIHNvIHdlIGdldCBudW1fc2RwX3N0cmVhbXMgKi8K
PiArCQltc3RiLT5saW5rX2FkZHJlc3Nfc2VudCA9IGZhbHNlOwo+ICsJCWRvd29yayA9IHRydWU7
Cj4gKwl9Cj4gIAo+ICAJb2xkX2RkcHMgPSBwb3J0LT5kZHBzOwo+ICsJcG9ydC0+aW5wdXQgPSBj
b25uX3N0YXQtPmlucHV0X3BvcnQ7Cj4gIAlwb3J0LT5tY3MgPSBjb25uX3N0YXQtPm1lc3NhZ2Vf
Y2FwYWJpbGl0eV9zdGF0dXM7Cj4gIAlwb3J0LT5sZHBzID0gY29ubl9zdGF0LT5sZWdhY3lfZGV2
aWNlX3BsdWdfc3RhdHVzOwo+ICAJcG9ydC0+ZGRwcyA9IGNvbm5fc3RhdC0+ZGlzcGxheXBvcnRf
ZGV2aWNlX3BsdWdfc3RhdHVzOwo+IEBAIC0yMTAzLDIxICsyMTI1LDIzIEBAIGRybV9kcF9tc3Rf
aGFuZGxlX2Nvbm5fc3RhdChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCj4gIAkJfQo+
ICAJfQo+ICAKPiAtCWlmICghcG9ydC0+aW5wdXQpIHsKPiAtCQlpbnQgcmV0ID0gZHJtX2RwX3Bv
cnRfc2V0X3BkdChwb3J0LAo+IC0JCQkJCSAgICAgIGNvbm5fc3RhdC0+cGVlcl9kZXZpY2VfdHlw
ZSk7Cj4gLQkJaWYgKHJldCA9PSAxKSB7Cj4gLQkJCWRvd29yayA9IHRydWU7Cj4gLQkJfSBlbHNl
IGlmIChyZXQgPCAwKSB7Cj4gLQkJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNoYW5nZSBQRFQgZm9y
IHBvcnQgJXA6ICVkXG4iLAo+IC0JCQkJICBwb3J0LCByZXQpOwo+IC0JCQlkb3dvcmsgPSBmYWxz
ZTsKPiAtCQl9Cj4gKwluZXdfcGR0ID0gcG9ydC0+aW5wdXQgPyBEUF9QRUVSX0RFVklDRV9OT05F
IDogY29ubl9zdGF0LT5wZWVyX2RldmljZV90eXBlOwo+ICsKPiArCXJldCA9IGRybV9kcF9wb3J0
X3NldF9wZHQocG9ydCwgbmV3X3BkdCk7Cj4gKwlpZiAocmV0ID09IDEpIHsKPiArCQlkb3dvcmsg
PSB0cnVlOwo+ICsJfSBlbHNlIGlmIChyZXQgPCAwKSB7Cj4gKwkJRFJNX0VSUk9SKCJGYWlsZWQg
dG8gY2hhbmdlIFBEVCBmb3IgcG9ydCAlcDogJWRcbiIsCj4gKwkJCSAgcG9ydCwgcmV0KTsKPiAr
CQlkb3dvcmsgPSBmYWxzZTsKPiAgCX0KPiAgCj4gIAlpZiAocG9ydC0+Y29ubmVjdG9yKQo+ICAJ
CWRybV9tb2Rlc2V0X3VubG9jaygmbWdyLT5iYXNlLmxvY2spOwo+ICsJZWxzZSBpZiAoY3JlYXRl
X2Nvbm5lY3RvcikKPiArCQlkcm1fZHBfbXN0X3BvcnRfYWRkX2Nvbm5lY3Rvcihtc3RiLCBwb3J0
KTsKPiAgCj4gK291dDoKPiAgCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7Cj4g
IAlpZiAoZG93b3JrKQo+ICAJCXF1ZXVlX3dvcmsoc3lzdGVtX2xvbmdfd3EsICZtc3RiLT5tZ3It
PndvcmspOwo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5l
ZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQ==
