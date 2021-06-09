Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4413A1C4D
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 19:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2106EAE2;
	Wed,  9 Jun 2021 17:46:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226496EAE2;
 Wed,  9 Jun 2021 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ylMKWUYw2QnydSbeeqGqbQ4d4p3MWpA7bfKGPeJjZtk=; b=FfZ+LzTTkM2bwH2RdcG1hbLhjA
 VX+zAI/EZaPAw8MkGj3a30ZJPIAj/covmVsOD3O4k4xAWoSl7mSDACW3hVJNHm3yhuLR7nGNN17Ce
 sxVCrS0jSUYukFjZjyMXCgHC59orpp+l4oApSsAFv/Qd18qvPzKpr5VvtsT9npD7eUMwGzoQ4Q21c
 I5d202K5Fe4tvmX8tFOdhifC6FvdtdqvYj9yHmXATdmYNicGUoM3NeANpi1OtCAoyAOqbrzIp1wzD
 QaAVCLWk3K7weYi3dQgZ/xrKg0M9hcoqtvpMbNqEKX3wbtLOCj/pYGih4askvUSHK0qUWbICpfpVR
 lmsyhhdQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lr2HA-0005Qa-Qu; Wed, 09 Jun 2021 20:46:00 +0300
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 imirkin@alum.mit.edu, linux-tegra@vger.kernel.org,
 nouveau@lists.freedesktop.org, ray.huang@amd.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
References: <20210609172902.1937-1-christian.koenig@amd.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <899d773e-9a7d-062c-47fa-080161b22cd6@kapsi.fi>
Date: Wed, 9 Jun 2021 20:45:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210609172902.1937-1-christian.koenig@amd.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: Re: [Nouveau] [PATCH] drm/nouveau: init the base GEM fields for
 internal BOs
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gNi85LzIxIDg6MjkgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gVFRNcyBidWZmZXIg
b2JqZWN0cyBhcmUgYmFzZWQgb24gR0VNIG9iamVjdHMgZm9yIHF1aXRlIGEgd2hpbGUKPiBhbmQg
cmVseSBvbiBpbml0aWFsaXppbmcgdGhvc2UgZmllbGRzIGJlZm9yZSBpbml0aWFsaXppbmcgdGhl
IFRUTSBCTy4KPiAKPiBOb3ZlYXUgbm93IGRvZXNuJ3QgaW5pdCB0aGUgR0VNIG9iamVjdCBmb3Ig
aW50ZXJuYWxseSBhbGxvY2F0ZWQgQk9zLAoKTm91dmVhdQoKPiBzbyBtYWtlIHN1cmUgdGhhdCB3
ZSBhdCBsZWFzdCBpbml0aWFsaXplIHNvbWUgbmVjZXNzYXJ5IGZpZWxkcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCA2ICsrKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JvLmMKPiBpbmRleCA1MjBiMWVhOWQxNmMuLjA4NTAyMzYyNGZiMCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBAQCAtMTQ5LDYgKzE0OSw4IEBAIG5vdXZl
YXVfYm9fZGVsX3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+ICAgCSAqLwo+ICAg
CWlmIChiby0+YmFzZS5kZXYpCj4gICAJCWRybV9nZW1fb2JqZWN0X3JlbGVhc2UoJmJvLT5iYXNl
KTsKPiArCWVsc2UKPiArCQlkbWFfcmVzdl9maW5pKCZiby0+YmFzZS5fcmVzdik7Cj4gICAKPiAg
IAlrZnJlZShudmJvKTsKPiAgIH0KPiBAQCAtMzMwLDYgKzMzMiwxMCBAQCBub3V2ZWF1X2JvX25l
dyhzdHJ1Y3Qgbm91dmVhdV9jbGkgKmNsaSwgdTY0IHNpemUsIGludCBhbGlnbiwKPiAgIAlpZiAo
SVNfRVJSKG52Ym8pKQo+ICAgCQlyZXR1cm4gUFRSX0VSUihudmJvKTsKPiAgIAo+ICsJbnZiby0+
Ym8uYmFzZS5zaXplID0gc2l6ZTsKPiArCWRtYV9yZXN2X2luaXQoJm52Ym8tPmJvLmJhc2UuX3Jl
c3YpOwo+ICsJZHJtX3ZtYV9ub2RlX3Jlc2V0KCZudmJvLT5iby5iYXNlLnZtYV9ub2RlKTsKPiAr
Cj4gICAJcmV0ID0gbm91dmVhdV9ib19pbml0KG52Ym8sIHNpemUsIGFsaWduLCBkb21haW4sIHNn
LCByb2JqKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlyZXR1cm4gcmV0Owo+IAoKVGhhdCB3b3Jrcywg
dGhhbmtzIGZvciB0aGUgZml4IQoKVGVzdGVkLWJ5OiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVu
ZW5AbnZpZGlhLmNvbT4KCk1pa2tvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQo=
