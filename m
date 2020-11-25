Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE7C2C48AF
	for <lists+nouveau@lfdr.de>; Wed, 25 Nov 2020 20:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D4D6EA61;
	Wed, 25 Nov 2020 19:46:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A647B6E90B
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 19:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606333562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e69pYqK6LdWzFPvgW/MsEcbIzlfutA0tPozCsp8JsBA=;
 b=Z5yLfhR/UyjAOAb+LalxmEM+GyGLj+jaQni/5BiUEwRoxnuxPIkylY4pGkB5vypsc3WrZo
 VCOhR2HBJgTOhcm6wZABH/57z6VrEu/Yn3/sN4oWjDNjsji1WHKpE2RRwlOsVEkTMnI7A5
 QsA6e5M8uSSRKUmSdTYp8LZ6OGr2sy0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-oDob55TCPA2KB4EsHdwNHg-1; Wed, 25 Nov 2020 14:46:00 -0500
X-MC-Unique: oDob55TCPA2KB4EsHdwNHg-1
Received: by mail-qv1-f71.google.com with SMTP id o16so3217752qvq.4
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 11:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=e69pYqK6LdWzFPvgW/MsEcbIzlfutA0tPozCsp8JsBA=;
 b=RdHXu4btqKAMOU9lf1jZoLHftHDuonTzxcnHnzplMEAKef/+8zVIPkX3oXfZiS0Dck
 FcU72Cd09Dk7MhGO6/L2+G7Y1G3Yv9/LBZzsD9JRSQvELtc4IZwTmuDSwcTQ7HS2GDQr
 mTgk/MZ7qpSAcHjSQAVX5+kTwBbGfbTydTb1NW1V61TjfMABHj6iXxEHjYIIDhZ/nx7/
 mibnWXtkJSW0NNE7262iIJsiE0/FdOCkkH2wP4gZYod7EJCiI9uTZpyAtKhSayak5Sp+
 0LWKLvNBQ2dm796l4wsss2Y2aSU4PqBmSjfKCSQRZQYuDj7RAPOhAOvAWss0DF4NeLh2
 uJ0w==
X-Gm-Message-State: AOAM531xeOHQeKe0PySJKVjyYVixZ+6GUYE8NzLrzWHspNcAGG1zbUp+
 h3gcZzCNms6CKgZd0WOPDnlOjK/09WLBJAwrfIPZnW7NHAL+LFrczHEPOEZ8QOzkPJm/UnY+YbZ
 /9K+6SFbJy51jxEL6wkbCnOLTPQ==
X-Received: by 2002:a37:e40e:: with SMTP id y14mr512137qkf.356.1606333560285; 
 Wed, 25 Nov 2020 11:46:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJpcF9jhzLh2FJKyoAjd88LJ5nR2LjSeUm7SVmZM9+VDLLKO7LmCId29U3QTbFbLzEqKyIfA==
X-Received: by 2002:a37:e40e:: with SMTP id y14mr512121qkf.356.1606333560000; 
 Wed, 25 Nov 2020 11:46:00 -0800 (PST)
Received: from xps13 ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id h142sm337753qke.104.2020.11.25.11.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 11:45:59 -0800 (PST)
Date: Wed, 25 Nov 2020 14:45:57 -0500
From: Jeremy Cline <jcline@redhat.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20201125194557.GC20747@xps13>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201103194912.184413-3-jcline@redhat.com>
 <505be3af57c36222564d0790aa8a992b1ea4d287.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <505be3af57c36222564d0790aa8a992b1ea4d287.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau: Add a dedicated mutex for
 the clients list
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjUsIDIwMjAgYXQgMDE6Mzc6MDZQTSAtMDUwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBPbiBUdWUsIDIwMjAtMTEtMDMgYXQgMTQ6NDkgLTA1MDAsIEplcmVteSBDbGluZSB3cm90
ZToKPiA+IFJhdGhlciB0aGFuIHByb3RlY3RpbmcgdGhlIG5vdXZlYXVfZHJtIGNsaWVudHMgbGlz
dCB3aXRoIHRoZSBsb2NrIHdpdGhpbgo+ID4gdGhlICJjbGllbnQiIG5vdXZlYXVfY2xpLCBhZGQg
YSBkZWRpY2F0ZWQgbG9jayB0byBzZXJpYWxpemUgYWNjZXNzIHRvCj4gPiB0aGUgbGlzdC4gVGhp
cyBpcyBib3RoIGNsZWFyZXIgYW5kIG5lY2Vzc2FyeSB0byBhdm9pZCBsb2NrZGVwIGJlaW5nCj4g
PiB1cHNldCB3aXRoIHVzIHdoZW4gd2UgbmVlZCB0byBpdGVyYXRlIHRocm91Z2ggYWxsIHRoZSBj
bGllbnRzIGluIHRoZQo+ID4gbGlzdCBhbmQgcG90ZW50aWFsbHkgbG9jayB0aGVpciBtdXRleCwg
d2hpY2ggaXMgdGhlIHNhbWUgY2xhc3MgYXMgdGhlCj4gPiBsb2NrIHByb3RlY3RpbmcgdGhlIGVu
dGlyZSBsaXN0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKZXJlbXkgQ2xpbmUgPGpjbGluZUBy
ZWRoYXQuY29tPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZHJtLmMgfCA5ICsrKysrLS0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2Rydi5oIHwgNSArKysrKwo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RybS5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZHJtLmMKPiA+IGluZGV4IDRmZTRkNjY0YzVmMi4uZDE4MmI4NzcyNThhIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwo+ID4gQEAgLTU1Nyw2ICs1NTcsNyBAQCBu
b3V2ZWF1X2RybV9kZXZpY2VfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBudmttX2RiZ29wdChub3V2ZWF1X2RlYnVnLCAiRFJN
Iik7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoElOSVRfTElTVF9IRUFEKCZkcm0tPmNsaWVu
dHMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgbXV0ZXhfaW5pdCgmZHJtLT5jbGllbnRzX2xvY2spOwo+
IAo+IExvb2tzIGxpa2UgeW91IGZvcmdvdCB0byBob29rIHVwIG11dGV4X2Rlc3Ryb3koKSBzb21l
d2hlcmUuIE5vdGUgdGhlcmUncwo+IGFjdHVhbGx5IHBsZW50eSBvZiBjb2RlIGluIG5vdXZlYXUg
cmlnaHQgbm93IHRoYXQgZm9yZ2V0cyB0byBkbyB0aGlzLCBidXQgYXQKPiBzb21lIHBvaW50IHdl
IHNob3VsZCBwcm9iYWJseSBmaXggdGhhdCBhbmQgYXZvaWQgYWRkaW5nIG1vcmUgc3BvdHMgd2hl
cmUgdGhlcmUncwo+IG5vIG11dGV4X2Rlc3Ryb3koKS4KPiAKCkknbSBndWlsdHkgb2YgaGF2aW5n
IGxvb2tlZCBhdCB0aGUgZXhpc3RpbmcgbG9ja2luZyBpbml0IGNvZGUgaW4gbm91dmVhdQphbmQg
bW9kZWxpbmcgdGhpcyB3b3JrIGFjY29yZGluZ2x5LiBJJ2xsIHNlbmQgb3V0IGEgZml4IGZvciB0
aGlzIHNob3J0bHkKYW5kIGxvb2sgYXQgdGlkeWluZyB1cCB0aGUgcmVzdCBvZiB0aGUgbG9ja3Mg
aW4gYSBzZXBhcmF0ZSBzZXJpZXMuClRoYW5rcyEKCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9s
b2NrX2luaXQoJmRybS0+dGlsZS5sb2NrKTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgLyog
d29ya2Fyb3VuZCBhbiBvZGQgaXNzdWUgb24gbnZjMSBieSBkaXNhYmxpbmcgdGhlIGRldmljZSdz
Cj4gPiBAQCAtMTA4OSw5ICsxMDkwLDkgQEAgbm91dmVhdV9kcm1fb3BlbihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUKPiA+ICpmcHJpdikKPiA+IMKgCj4gPiDCoMKgwqDC
oMKgwqDCoMKgZnByaXYtPmRyaXZlcl9wcml2ID0gY2xpOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKg
wqDCoG11dGV4X2xvY2soJmRybS0+Y2xpZW50Lm11dGV4KTsKPiA+ICvCoMKgwqDCoMKgwqDCoG11
dGV4X2xvY2soJmRybS0+Y2xpZW50c19sb2NrKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBsaXN0X2Fk
ZCgmY2xpLT5oZWFkLCAmZHJtLT5jbGllbnRzKTsKPiA+IC3CoMKgwqDCoMKgwqDCoG11dGV4X3Vu
bG9jaygmZHJtLT5jbGllbnQubXV0ZXgpOwo+ID4gK8KgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2Nr
KCZkcm0tPmNsaWVudHNfbG9jayk7Cj4gPiDCoAo+ID4gwqBkb25lOgo+ID4gwqDCoMKgwqDCoMKg
wqDCoGlmIChyZXQgJiYgY2xpKSB7Cj4gPiBAQCAtMTExNyw5ICsxMTE4LDkgQEAgbm91dmVhdV9k
cm1fcG9zdGNsb3NlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdAo+ID4gZHJtX2ZpbGUg
KmZwcml2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBub3V2ZWF1X2FiaTE2
X2ZpbmkoY2xpLT5hYmkxNik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZjbGkt
Pm11dGV4KTsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZkcm0tPmNsaWVu
dC5tdXRleCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZkcm0tPmNsaWVudHNfbG9j
ayk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgbGlzdF9kZWwoJmNsaS0+aGVhZCk7Cj4gPiAtwqDCoMKg
wqDCoMKgwqBtdXRleF91bmxvY2soJmRybS0+Y2xpZW50Lm11dGV4KTsKPiA+ICvCoMKgwqDCoMKg
wqDCoG11dGV4X3VubG9jaygmZHJtLT5jbGllbnRzX2xvY2spOwo+ID4gwqAKPiA+IMKgwqDCoMKg
wqDCoMKgwqBub3V2ZWF1X2NsaV9maW5pKGNsaSk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKga2ZyZWUo
Y2xpKTsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Ry
di5oCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgKPiA+IGluZGV4
IDlkMDRkMWIzNjQzNC4uNTUwZTVmMzM1MTQ2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kcnYuaAo+ID4gQEAgLTE0MSw2ICsxNDEsMTEgQEAgc3RydWN0IG5vdXZlYXVf
ZHJtIHsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGxpc3RfaGVhZCBjbGllbnRz
Owo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDCoC8qKgo+ID4gK8KgwqDCoMKgwqDCoMKgICogQGNs
aWVudHNfbG9jazogUHJvdGVjdHMgYWNjZXNzIHRvIHRoZSBAY2xpZW50cyBsaXN0IG9mICZzdHJ1
Y3QKPiA+IG5vdXZlYXVfY2xpLgo+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgbXV0ZXggY2xpZW50c19sb2NrOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDC
oHU4IG9sZF9wbV9jYXA7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB7Cj4gCj4g
LS0gCj4gU2luY2VyZWx5LAo+ICAgIEx5dWRlIFBhdWwgKHNoZS9oZXIpCj4gICAgU29mdHdhcmUg
RW5naW5lZXIgYXQgUmVkIEhhdAo+ICAgIAo+IE5vdGU6IEkgZGVhbCB3aXRoIGEgbG90IG9mIGVt
YWlscyBhbmQgaGF2ZSBhIGxvdCBvZiBidWdzIG9uIG15IHBsYXRlLiBJZiB5b3UndmUKPiBhc2tl
ZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRj
aCwgZXRjLiBhbmQgSQo+IGhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFzZSBmZWVs
IGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCj4gb24gbXkgc3RhdHVzLiBJ
IGRvbid0IGJpdGUhCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
