Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CA2C47BE
	for <lists+nouveau@lfdr.de>; Wed, 25 Nov 2020 19:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E05C6EA5D;
	Wed, 25 Nov 2020 18:37:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0AF6EA3E
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606329430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJkyuZXR06RwPbFHnHYe7mM4XfSI6mqJjT0lQPEIAPY=;
 b=NddnLJqLEin+nLS6/F+sZ3r/0f+LFTGlJyleKasu+3KIrGfrfx40XobbY68TpFPrC/66D8
 uaifQpCgjfPo7aZqoNvozmG5Y2RwjSU7l9f3Kz0XZp4WR0fvLfIkNbfy//+w3s9XQ9GVmS
 nr5rR62ok4fvjOAux17moIMUkgsYSiQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-Ml1c243hMJKhYo9RtfByVw-1; Wed, 25 Nov 2020 13:37:09 -0500
X-MC-Unique: Ml1c243hMJKhYo9RtfByVw-1
Received: by mail-qk1-f200.google.com with SMTP id c71so3107604qkg.21
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 10:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=EJkyuZXR06RwPbFHnHYe7mM4XfSI6mqJjT0lQPEIAPY=;
 b=nksdKegCAgrfT4YCAeWnWizwAFqpEZOIHBvstPDhhr23onaWOxknF7xhzerEw70EvI
 +nwrrswYWLB54UPKcY/Tsq3r6cIASToH9SFTlrJ9f9T4TZia3ItloVTbUS3B9Gg/QCIa
 sqBYoICUfpCfPTa5YNFcHKlUpusJZt4+ulJAS0qwyykhwZHbSGOiBUYU0WtCbgnhlsrw
 T+WABVcltJOPZyi5hoeA0ecXIGweGnE14xyiWDrkT49D54zmVXheeXxL3EMPUf0w3tJP
 KgRmKIpswclr/NeuJlStVtU/zyMlPmxNeofZwXcYyJCLrNkoEL1VJUuq2taFGx1N2Tyb
 y/2A==
X-Gm-Message-State: AOAM531BUlEngGpggP+laWHJ7S/FkiYGqk7xiWIBt4/gYArFV0qMT9xa
 mtjtul1AKulzLEECeA5w1sKG0K902qHd0WI/IsdBP69LxrqPWBWMHBXF3mkQVO5o0kIN5CEScif
 wWThnE4NZAc/qtyos2kE+tWdj2Q==
X-Received: by 2002:aed:3ff1:: with SMTP id w46mr180290qth.83.1606329428709;
 Wed, 25 Nov 2020 10:37:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwq57UBIs3NHQEECAhbFbsnJGxdoiR0N5IgQQuxbOJr8SUKpOdW3DtqMTZ9p7kt2BufNBas3Q==
X-Received: by 2002:aed:3ff1:: with SMTP id w46mr180272qth.83.1606329428487;
 Wed, 25 Nov 2020 10:37:08 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id t56sm139681qth.27.2020.11.25.10.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 10:37:07 -0800 (PST)
Message-ID: <505be3af57c36222564d0790aa8a992b1ea4d287.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 25 Nov 2020 13:37:06 -0500
In-Reply-To: <20201103194912.184413-3-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201103194912.184413-3-jcline@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTExLTAzIGF0IDE0OjQ5IC0wNTAwLCBKZXJlbXkgQ2xpbmUgd3JvdGU6Cj4g
UmF0aGVyIHRoYW4gcHJvdGVjdGluZyB0aGUgbm91dmVhdV9kcm0gY2xpZW50cyBsaXN0IHdpdGgg
dGhlIGxvY2sgd2l0aGluCj4gdGhlICJjbGllbnQiIG5vdXZlYXVfY2xpLCBhZGQgYSBkZWRpY2F0
ZWQgbG9jayB0byBzZXJpYWxpemUgYWNjZXNzIHRvCj4gdGhlIGxpc3QuIFRoaXMgaXMgYm90aCBj
bGVhcmVyIGFuZCBuZWNlc3NhcnkgdG8gYXZvaWQgbG9ja2RlcCBiZWluZwo+IHVwc2V0IHdpdGgg
dXMgd2hlbiB3ZSBuZWVkIHRvIGl0ZXJhdGUgdGhyb3VnaCBhbGwgdGhlIGNsaWVudHMgaW4gdGhl
Cj4gbGlzdCBhbmQgcG90ZW50aWFsbHkgbG9jayB0aGVpciBtdXRleCwgd2hpY2ggaXMgdGhlIHNh
bWUgY2xhc3MgYXMgdGhlCj4gbG9jayBwcm90ZWN0aW5nIHRoZSBlbnRpcmUgbGlzdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKZXJlbXkgQ2xpbmUgPGpjbGluZUByZWRoYXQuY29tPgo+IC0tLQo+IMKg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDkgKysrKystLS0tCj4gwqBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oIHwgNSArKysrKwo+IMKgMiBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCj4gYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCj4gaW5kZXggNGZlNGQ2NjRjNWYyLi5kMTgyYjg3
NzI1OGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKPiBAQCAtNTU3
LDYgKzU1Nyw3IEBAIG5vdXZlYXVfZHJtX2RldmljZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBudmttX2RiZ29wdChub3V2ZWF1
X2RlYnVnLCAiRFJNIik7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgSU5JVF9MSVNUX0hFQUQoJmRy
bS0+Y2xpZW50cyk7Cj4gK8KgwqDCoMKgwqDCoMKgbXV0ZXhfaW5pdCgmZHJtLT5jbGllbnRzX2xv
Y2spOwoKTG9va3MgbGlrZSB5b3UgZm9yZ290IHRvIGhvb2sgdXAgbXV0ZXhfZGVzdHJveSgpIHNv
bWV3aGVyZS4gTm90ZSB0aGVyZSdzCmFjdHVhbGx5IHBsZW50eSBvZiBjb2RlIGluIG5vdXZlYXUg
cmlnaHQgbm93IHRoYXQgZm9yZ2V0cyB0byBkbyB0aGlzLCBidXQgYXQKc29tZSBwb2ludCB3ZSBz
aG91bGQgcHJvYmFibHkgZml4IHRoYXQgYW5kIGF2b2lkIGFkZGluZyBtb3JlIHNwb3RzIHdoZXJl
IHRoZXJlJ3MKbm8gbXV0ZXhfZGVzdHJveSgpLgoKPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2Nr
X2luaXQoJmRybS0+dGlsZS5sb2NrKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiB3b3JrYXJv
dW5kIGFuIG9kZCBpc3N1ZSBvbiBudmMxIGJ5IGRpc2FibGluZyB0aGUgZGV2aWNlJ3MKPiBAQCAt
MTA4OSw5ICsxMDkwLDkgQEAgbm91dmVhdV9kcm1fb3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCBzdHJ1Y3QgZHJtX2ZpbGUKPiAqZnByaXYpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZnByaXYt
PmRyaXZlcl9wcml2ID0gY2xpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmZHJt
LT5jbGllbnQubXV0ZXgpOwo+ICvCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmRybS0+Y2xpZW50
c19sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgbGlzdF9hZGQoJmNsaS0+aGVhZCwgJmRybS0+Y2xp
ZW50cyk7Cj4gLcKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZkcm0tPmNsaWVudC5tdXRleCk7
Cj4gK8KgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZkcm0tPmNsaWVudHNfbG9jayk7Cj4gwqAK
PiDCoGRvbmU6Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgJiYgY2xpKSB7Cj4gQEAgLTExMTcs
OSArMTExOCw5IEBAIG5vdXZlYXVfZHJtX3Bvc3RjbG9zZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCBzdHJ1Y3QKPiBkcm1fZmlsZSAqZnByaXYpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBub3V2ZWF1X2FiaTE2X2ZpbmkoY2xpLT5hYmkxNik7Cj4gwqDCoMKgwqDCoMKgwqDCoG11
dGV4X3VubG9jaygmY2xpLT5tdXRleCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBtdXRleF9sb2Nr
KCZkcm0tPmNsaWVudC5tdXRleCk7Cj4gK8KgwqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmZHJtLT5j
bGllbnRzX2xvY2spOwo+IMKgwqDCoMKgwqDCoMKgwqBsaXN0X2RlbCgmY2xpLT5oZWFkKTsKPiAt
wqDCoMKgwqDCoMKgwqBtdXRleF91bmxvY2soJmRybS0+Y2xpZW50Lm11dGV4KTsKPiArwqDCoMKg
wqDCoMKgwqBtdXRleF91bmxvY2soJmRybS0+Y2xpZW50c19sb2NrKTsKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqBub3V2ZWF1X2NsaV9maW5pKGNsaSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGtmcmVlKGNs
aSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgK
PiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgKPiBpbmRleCA5ZDA0ZDFi
MzY0MzQuLjU1MGU1ZjMzNTE0NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
cnYuaAo+IEBAIC0xNDEsNiArMTQxLDExIEBAIHN0cnVjdCBub3V2ZWF1X2RybSB7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IGxpc3RfaGVhZCBjbGllbnRzOwo+IMKgCj4gK8KgwqDCoMKg
wqDCoMKgLyoqCj4gK8KgwqDCoMKgwqDCoMKgICogQGNsaWVudHNfbG9jazogUHJvdGVjdHMgYWNj
ZXNzIHRvIHRoZSBAY2xpZW50cyBsaXN0IG9mICZzdHJ1Y3QKPiBub3V2ZWF1X2NsaS4KPiArwqDC
oMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbXV0ZXggY2xpZW50c19sb2Nr
Owo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgdTggb2xkX3BtX2NhcDsKPiDCoAo+IMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgewoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAg
U29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qg
b2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQph
c2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBw
YXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVl
bCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkg
ZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
