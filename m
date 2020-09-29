Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73827D528
	for <lists+nouveau@lfdr.de>; Tue, 29 Sep 2020 19:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857AE89C63;
	Tue, 29 Sep 2020 17:54:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033E489C63
 for <nouveau@lists.freedesktop.org>; Tue, 29 Sep 2020 17:54:20 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601402060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RB1qMPqA5Fuv69vC0OQ8pzSzT2FY50yu2m0896R3wr8=;
 b=fV68GcYU20i0fMnAvksiGmfgbmGRAlkQCxVN4SifP7KG6zqXtBKc8YAOC79VwNbBSXkW12
 9IDyjPU9ItSdL5VYrT8SP0dubU8UHt2TWuDvmeHcn93SRq6c1fXKX7BzEr+e+TdSwmqNQy
 yOIRLavi5hyxeuGdu0pK5EjS56WHWyk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-Dj3Gd8iJOE-h2oJwnLV01w-1; Tue, 29 Sep 2020 13:54:16 -0400
X-MC-Unique: Dj3Gd8iJOE-h2oJwnLV01w-1
Received: by mail-qk1-f198.google.com with SMTP id d22so3233048qkb.18
 for <nouveau@lists.freedesktop.org>; Tue, 29 Sep 2020 10:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RB1qMPqA5Fuv69vC0OQ8pzSzT2FY50yu2m0896R3wr8=;
 b=kEeiPxJ2mTniNjNbsewp+BquBerjvNec8tmmOThRV0dK0ggBD6VbyThaWNfrkbbho5
 26h1hZqalKrzLRLNNYbm9c/mEj+JuHlSKWjN71iP3aLVThXJZdHFfXzcd4NBjWOLEXry
 +TFx4TXDJf4glaAru10SP/kgYuZ3bZBjjvjDAB8+E+i+DkbUHAwPe4JbySfPwn8Mwg4u
 tSgbWv62BGpTCY9qOQKy6iS7qTEBEvKcbnGfvPJ5bcZgc+cqHhc/cngp89g6aVT+4VaP
 TN6QOurQQSIGeX1OSycdKJE2bhmumhPS8ny7qZbfBauAVRoAp3MI5lWHCAXwHNXfWHVp
 ricA==
X-Gm-Message-State: AOAM532xamvq+sXTp3us/MZGd0nPOqWoSncv/hIYUcfeC8UUd/mkj0Ct
 WwLnfOaG4sJsVlF5pJE34WnVT5d4zOrz8hqScFiLtXRm0nBGhQ89SJWpFyCJwOK6RiQCZG26jx9
 cjfL9oHDt6F0SV8gk3DK/ufUikQ==
X-Received: by 2002:ac8:5159:: with SMTP id h25mr4452893qtn.328.1601402055651; 
 Tue, 29 Sep 2020 10:54:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV+bFO7MhJ0AMnMicvOFYCYwL3jmCqbhV68goafFCYN30T29d9Br4VQUCjY5MWXadhB42r9g==
X-Received: by 2002:ac8:5159:: with SMTP id h25mr4452877qtn.328.1601402055427; 
 Tue, 29 Sep 2020 10:54:15 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f127sm5673443qke.133.2020.09.29.10.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 10:54:14 -0700 (PDT)
Message-ID: <9e12d6c091d18be6253717f33f4c09013361e532.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Tue, 29 Sep 2020 13:54:13 -0400
In-Reply-To: <20200928130141.GV6112@intel.com>
References: <20200922210510.156220-1-lyude@redhat.com>
 <20200928130141.GV6112@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: Fix clock checking
 algorithm in nv50_dp_mode_valid()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTA5LTI4IGF0IDE2OjAxICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVHVlLCBTZXAgMjIsIDIwMjAgYXQgMDU6MDU6MTBQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IFdoaWxlIEkgdGhvdWdodCBJIGhhZCB0aGlzIGNvcnJlY3QgKHNpbmNlIGl0IGFj
dHVhbGx5IGRpZCByZWplY3QgbW9kZXMKPiA+IGxpa2UgSSBleHBlY3RlZCBkdXJpbmcgdGVzdGlu
ZyksIFZpbGxlIFN5cmphbGEgZnJvbSBJbnRlbCBwb2ludGVkIG91dAo+ID4gdGhhdCB0aGUgbG9n
aWMgaGVyZSBpc24ndCBjb3JyZWN0LiBtYXhfY2xvY2sgcmVmZXJzIHRvIHRoZSBtYXggc3ltYm9s
Cj4gPiByYXRlIHN1cHBvcnRlZCBieSB0aGUgZW5jb2Rlciwgc28gbGltaXRpbmcgY2xvY2sgdG8g
ZHNfY2xvY2sgdXNpbmcgbWF4KCkKPiA+IGRvZXNuJ3QgbWFrZSBzZW5zZS4gQWRkaXRpb25hbGx5
LCB3ZSB3YW50IHRvIGNoZWNrIGFnYWluc3QgNmJwYyBmb3IgdGhlCj4gPiB0aW1lIGJlaW5nIHNp
bmNlIHRoYXQncyB0aGUgbWluaW11bSBwb3NzaWJsZSBicGMgaGVyZSwgbm90IHRoZSByZXBvcnRl
ZAo+ID4gYnBjIGZyb20gdGhlIGNvbm5lY3Rvci4gU2VlOgo+ID4gCj4gPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMC1TZXB0ZW1iZXIvMjgwMjc2
Lmh0bWwKPiA+IAo+ID4gRm9yIG1vcmUgaW5mby4KPiA+IAo+ID4gU28sIGxldCdzIHJld3JpdGUg
dGhpcyB1c2luZyBWaWxsZSdzIGFkdmljZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IEZpeGVzOiA0MDlkMzgxMzliNDIgKCJkcm0vbm91
dmVhdS9rbXMvbnY1MC06IFVzZSBkb3duc3RyZWFtIERQIGNsb2NrCj4gPiBsaW1pdHMgZm9yIG1v
ZGUgdmFsaWRhdGlvbiIpCj4gPiBDYzogVmlsbGUgU3lyasODxpLDgsKkbMODxpLDgsKkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+ID4gQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYyB8IDIzICsrKysrKysrKysr
KystLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kcC5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYwo+
ID4gaW5kZXggN2I2NDBlMDViZDRjZC4uMjRjODFlNDIzZDM0OSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jCj4gPiBAQCAtMjMxLDIzICsyMzEsMjYgQEAgbnY1MF9k
cF9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gPiAgCQkgICBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiA+ICAJCSAgIHVuc2lnbmVkICpv
dXRfY2xvY2spCj4gPiAgewo+ID4gLQljb25zdCB1bnNpZ25lZCBtaW5fY2xvY2sgPSAyNTAwMDsK
PiA+IC0JdW5zaWduZWQgbWF4X2Nsb2NrLCBkc19jbG9jaywgY2xvY2s7Cj4gPiArCWNvbnN0IHVu
c2lnbmVkIGludCBtaW5fY2xvY2sgPSAyNTAwMDsKPiA+ICsJdW5zaWduZWQgaW50IG1heF9jbG9j
aywgZHNfY2xvY2ssIGNsb2NrOwo+ID4gKwljb25zdCB1OCBicHAgPSAxODsgLyogNiBicGMgKi8K
PiAKPiBBRkFJQ1MgbnY1MF9vdXRwX2F0b21pY19jaGVjaygpIGFuZCBudjUwX21zdG9fYXRvbWlj
X2NoZWNrKCkKPiBqdXN0IGJsaW5kbHkgdXNlIGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJwYyB3
aXRob3V0IGFueSBmYWxsYmFjawo+IGxvZ2ljIHRvIGxvd2VyIHRoZSBicGMuIFNvIElsaWEncyBj
b25jZXJucyBzZWVtIHdlbGwgZm91bmRlZC4KPiBXaXRob3V0IHRoYXQgbG9naWMgSSBndWVzcyB5
b3Ugc2hvdWxkIGp1c3QgdXNlCj4gY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnBjIGhlcmUgYXMg
d2VsbC4KPiAKPiA+ICAJZW51bSBkcm1fbW9kZV9zdGF0dXMgcmV0Owo+ID4gIAo+ID4gIAlpZiAo
bW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSAmJiAhb3V0cC0+Y2Fwcy5kcF9p
bnRlcmxhY2UpCj4gPiAgCQlyZXR1cm4gTU9ERV9OT19JTlRFUkxBQ0U7Cj4gPiAgCj4gPiAgCW1h
eF9jbG9jayA9IG91dHAtPmRwLmxpbmtfbnIgKiBvdXRwLT5kcC5saW5rX2J3Owo+ID4gLQlkc19j
bG9jayA9IGRybV9kcF9kb3duc3RyZWFtX21heF9kb3RjbG9jayhvdXRwLT5kcC5kcGNkLAo+ID4g
LQkJCQkJCSAgb3V0cC0+ZHAuZG93bnN0cmVhbV9wb3J0cyk7Cj4gPiAtCWlmIChkc19jbG9jaykK
PiA+IC0JCW1heF9jbG9jayA9IG1pbihtYXhfY2xvY2ssIGRzX2Nsb2NrKTsKPiA+IC0KPiA+IC0J
Y2xvY2sgPSBtb2RlLT5jbG9jayAqIChjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGMgKiAzKSAv
IDEwOwo+ID4gLQlyZXQgPSBub3V2ZWF1X2Nvbm5fbW9kZV9jbG9ja192YWxpZChtb2RlLCBtaW5f
Y2xvY2ssIG1heF9jbG9jaywKPiA+IC0JCQkJCSAgICAmY2xvY2spOwo+ID4gKwljbG9jayA9IG1v
ZGUtPmNsb2NrICogYnBwIC8gODsKPiA+ICsJaWYgKGNsb2NrID4gbWF4X2Nsb2NrKQo+ID4gKwkJ
cmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKPiAKPiBUaGlzIHN0dWZmIHZzLiBub3V2ZWF1X2Nvbm5f
bW9kZV9jbG9ja192YWxpZCgpIHN0aWxsIHNlZW1zIGEgYml0IG1lc3N5Lgo+IFRoZSBtYXhfY2xv
Y2sgeW91IHBhc3MgdG8gbm91dmVhdV9jb25uX21vZGVfY2xvY2tfdmFsaWQoKSBpcyB0aGUgbWF4
Cj4gc3ltYm9sIGNsb2NrLCBidXQgbm91dmVhdV9jb25uX21vZGVfY2xvY2tfdmFsaWQoKSBjaGVj
a3MgaXQgYWdhaW5zdCB0aGUKPiBkb3RjbG9jay4gQWxzbyBvbmx5IG5vdXZlYXVfY29ubl9tb2Rl
X2Nsb2NrX3ZhbGlkKCkgaGFzIGFueSBraW5kIG9mCj4gc3RlcmVvIDNEIGhhbmRsaW5nLCBidXQg
QUZBSUNTIHN0ZXJlb19hbGxvd2VkIGlzIGFsc28gc2V0IGZvciBEUD8KCi4uLm5vdCBzdXJlIEkn
bSBmb2xsb3dpbmcgeW91IGhlcmUsIGl0J3Mgc2V0IHRvIHRydWUgZm9yIERQIHNvIGRvbid0IHdl
IHdhbnQKdG8gY2hlY2sgaXQgYW5kIGFkanVzdCB0aGUgcGl4ZWwgY2xvY2sgd2Ugb3V0cHV0IGFj
Y29yZGluZ2x5PwoKPiAKPiA+ICsKPiA+ICsJZHNfY2xvY2sgPSBkcm1fZHBfZG93bnN0cmVhbV9t
YXhfZG90Y2xvY2sob3V0cC0+ZHAuZHBjZCwgb3V0cC0KPiA+ID5kcC5kb3duc3RyZWFtX3BvcnRz
KTsKPiA+ICsJaWYgKGRzX2Nsb2NrICYmIG1vZGUtPmNsb2NrID4gZHNfY2xvY2spCj4gPiArCQly
ZXR1cm4gTU9ERV9DTE9DS19ISUdIOwo+ID4gKwo+ID4gKwlyZXQgPSBub3V2ZWF1X2Nvbm5fbW9k
ZV9jbG9ja192YWxpZChtb2RlLCBtaW5fY2xvY2ssIG1heF9jbG9jaywKPiA+ICZjbG9jayk7Cj4g
PiAgCWlmIChvdXRfY2xvY2spCj4gPiAgCQkqb3V0X2Nsb2NrID0gY2xvY2s7Cj4gPiArCj4gPiAg
CXJldHVybiByZXQ7Cj4gPiAgfQo+ID4gLS0gCj4gPiAyLjI2LjIKLS0gCkNoZWVycywKCUx5dWRl
IFBhdWwgKHNoZS9oZXIpCglTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
