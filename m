Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E963B50F2
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4653B6E082;
	Sun, 27 Jun 2021 03:34:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C616ECA7;
 Thu, 10 Jun 2021 09:21:04 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id 5so4054266qvf.1;
 Thu, 10 Jun 2021 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P4iEhDem4kZK+SyUyBPttrlpuO+aLuZVSlxOmTIA50w=;
 b=qVkWH4RnV6lnk+N0kipQ0LUeMbBIPfTBjgz7Bn++bEj02Yak31f7aFlKdIuJTtz5TQ
 tnw5Up1LQtz7kKB/aDUPkOdCQtsikVSBSVRwqsJdOhK9WAb0B9izPnvPEQGJpFBMPeLr
 JT+PRh53KIuMz+rY40ic9eJAoSVtmJ68V3msPDFdym7WhN/hNV3ocWBm4//ZfGPs2WLD
 Uy2/w9qGa0gq40MO42xAvKdFTnbHODQn4O7SuzaKkYR8tORAm/rsQbXl/AKVJBjitxDg
 fw3NQzxSOaz8/eN83N7HefbAURto4NHhp0LQVD3KyPftkcOnEptPAcs8faMJnPhhynXE
 KYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P4iEhDem4kZK+SyUyBPttrlpuO+aLuZVSlxOmTIA50w=;
 b=IatFocKqnoZNG0fAhO9ByfjPz3ABuvLALQhKinnFzxx03WISLlopt9EeDL2hBMynB9
 CyWKFRQ1rViSSzjiub2Bsdcx4YEe/YdNHyiq9jv5IdwEGTR8tUE1kngnqDACW2Itd+io
 jdUrQS/Uv7Eh4nIldZ1GiDsv5YkXlsiLg/pD4+KJmYbjt0RJUVkLTmb4nBcgUXLz3i3l
 a1Cq3qvpQ0n7Db/6LqSmpga3CUMNHVnN/F+CyGRhGeIlM2j0SSqqDQNgueTqVEAWQddd
 KIAHyRcJGtuRKpRPjSopWUq8EaulzQ0J3V4izMN7ncaPu1a1NTdvPBX5Eh4OPVu3AOOt
 CwNA==
X-Gm-Message-State: AOAM531LQinZ8o698GZpOShY8/LgtHFJf9rvaW65wJQ25VKljNZ6iyh3
 LZnl3/5x0xWlBfFf58flrwEdMD+Re8D7/4woffM=
X-Google-Smtp-Source: ABdhPJwhXLh64zHDWG2mptUnFVGdHO2Sbc8j3h5R1chhHutwY1ett/fLW3sF8OgRKC+x7iYZapFSyWZQNtgMeqcUi6E=
X-Received: by 2002:a05:6214:764:: with SMTP id
 f4mr4032377qvz.60.1623316863810; 
 Thu, 10 Jun 2021 02:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210609172902.1937-1-christian.koenig@amd.com>
In-Reply-To: <20210609172902.1937-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 10 Jun 2021 10:20:37 +0100
Message-ID: <CAM0jSHPXTtqQ+E7+yOXnzyOPj4GX_wfiky92RYMMQWxTEM9BEQ@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
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
Cc: nouveau@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 Matthew Auld <matthew.auld@intel.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCA5IEp1biAyMDIxIGF0IDE4OjI5LCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUVE1zIGJ1ZmZlciBvYmplY3RzIGFy
ZSBiYXNlZCBvbiBHRU0gb2JqZWN0cyBmb3IgcXVpdGUgYSB3aGlsZQo+IGFuZCByZWx5IG9uIGlu
aXRpYWxpemluZyB0aG9zZSBmaWVsZHMgYmVmb3JlIGluaXRpYWxpemluZyB0aGUgVFRNIEJPLgo+
Cj4gTm92ZWF1IG5vdyBkb2Vzbid0IGluaXQgdGhlIEdFTSBvYmplY3QgZm9yIGludGVybmFsbHkg
YWxsb2NhdGVkIEJPcywKPiBzbyBtYWtlIHN1cmUgdGhhdCB3ZSBhdCBsZWFzdCBpbml0aWFsaXpl
IHNvbWUgbmVjZXNzYXJ5IGZpZWxkcy4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCmZ3aXcsClJldmlld2VkLWJ5OiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gaW5kZXggNTIw
YjFlYTlkMTZjLi4wODUwMjM2MjRmYjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iby5jCj4gQEAgLTE0OSw2ICsxNDksOCBAQCBub3V2ZWF1X2JvX2RlbF90dG0oc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibykKPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKGJvLT5iYXNl
LmRldikKPiAgICAgICAgICAgICAgICAgZHJtX2dlbV9vYmplY3RfcmVsZWFzZSgmYm8tPmJhc2Up
Owo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBkbWFfcmVzdl9maW5pKCZiby0+YmFz
ZS5fcmVzdik7Cj4KPiAgICAgICAgIGtmcmVlKG52Ym8pOwo+ICB9Cj4gQEAgLTMzMCw2ICszMzIs
MTAgQEAgbm91dmVhdV9ib19uZXcoc3RydWN0IG5vdXZlYXVfY2xpICpjbGksIHU2NCBzaXplLCBp
bnQgYWxpZ24sCj4gICAgICAgICBpZiAoSVNfRVJSKG52Ym8pKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihudmJvKTsKPgo+ICsgICAgICAgbnZiby0+Ym8uYmFzZS5zaXplID0gc2l6
ZTsKPiArICAgICAgIGRtYV9yZXN2X2luaXQoJm52Ym8tPmJvLmJhc2UuX3Jlc3YpOwo+ICsgICAg
ICAgZHJtX3ZtYV9ub2RlX3Jlc2V0KCZudmJvLT5iby5iYXNlLnZtYV9ub2RlKTsKPiArCj4gICAg
ICAgICByZXQgPSBub3V2ZWF1X2JvX2luaXQobnZibywgc2l6ZSwgYWxpZ24sIGRvbWFpbiwgc2cs
IHJvYmopOwo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsK
PiAtLQo+IDIuMjUuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
