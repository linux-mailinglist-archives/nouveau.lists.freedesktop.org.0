Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1E3B05CD
	for <lists+nouveau@lfdr.de>; Tue, 22 Jun 2021 15:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E56E508;
	Tue, 22 Jun 2021 13:27:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855706E508;
 Tue, 22 Jun 2021 13:27:19 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id r16so11257696oiw.3;
 Tue, 22 Jun 2021 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cO64HjfY7zNoK3o+z033NE4yyjdDHedNRwY8vXER4vQ=;
 b=tNvOXU+QX2QJs+WToJo0sEUkiFc6PcN1b7MhrMAA/TopNGEKVupLKWwx8wk+dcejFp
 sCDmU7+hsAjjXLgo7azCee8i93fql+u32UkdgABzzrffHkQp7ThqBysMk8HMZDO93DdA
 ILJO3l4N4qzgWdI1ARu602wbUU9EDTTuyvik/UUrkg6zBfFsC+BDyHbA9mNpU4a8zRq6
 EzqEFwcl5jcprjEspoxRxOTIE6nZMKf4qfTEdIMk3pHI9Df5fbmoR7poEv9Pl7yKJfT4
 b2BAmNt8yxFG/4ejE+VSXL4Fl1w5p1iQb4kOBGzkRJA3LmapUZyWw1alHME61NpC4izE
 AN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cO64HjfY7zNoK3o+z033NE4yyjdDHedNRwY8vXER4vQ=;
 b=HtOfP6ZNk+JzrGJVHRpaYbO1t+7kAjSueRJ5SGVLCZw5SiFN6Jb9qxbdmas7dhew89
 Y1qaFtY2hyR51Y9lYKAvVn0maoZO1fRFuwnf1ysearYqPEGKLNrubql9eASgzMhYMvPd
 4iuDL7Cn0qQOq5ghxueCqj4G0Octp24Mic27hoPeG4px5uiFJAkef44hGaLMN9uoU9/r
 ocRAuKRjG520/hyV1K1qEY8josGlCJy/AUjgHZXjVe+mh8M6NJ2bWBLyaCXlP3TyMk6s
 2UX6SElQonG0uMe+3CNqKpqwfgY5n0AThnUIGfilHwf2pi7krF+p0Nt9P2YZvKxfgnB7
 qsjw==
X-Gm-Message-State: AOAM533hIgOcs6rGwYo55v64JZiQ8rp6894duWkmrK09rqO1WD89Yosf
 sPukEH9gqLD4tz2ZmuaM6jYbU9aB9K1pm6ds7+o=
X-Google-Smtp-Source: ABdhPJxb0AIHYQQktiOBdlyyOtOiRLDUVeLRQEw+8NfaFVfVs9os58oUh51UPoA6rNP5GeVxmYdp3K9iwSRm9p/a/10=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr2895569oic.5.1624368438642; 
 Tue, 22 Jun 2021 06:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210614110517.1624-1-christian.koenig@amd.com>
 <8f2720e3-8a86-11bc-7988-b763a5f1525a@gmail.com>
In-Reply-To: <8f2720e3-8a86-11bc-7988-b763a5f1525a@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Jun 2021 09:27:07 -0400
Message-ID: <CADnq5_NmVJbFzhf7swvkU-3xbMamTxgALcHdnCRNEaHZRR5BBA@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix dma_address check for
 CPU/GPU sync
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, linux@zary.sk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgNTozMiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQaW5nPyBEb2VzIGFueWJvZHkg
d2FudHMgdG8gZ2l2ZSBtZSBhbiByYiBvciBhY2tlZC1ieT8KPgo+IEFHUCBpcyBiYXNpY2FsbHkg
YnJva2VuIG9uIG5vdXZldSB3aXRob3V0IHRoaXMuCgpMb29rcyBjb3JyZWN0IHRvIG1lLgpBY2tl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPgo+IENocmlz
dGlhbi4KPgo+IEFtIDE0LjA2LjIxIHVtIDEzOjA1IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoK
PiA+IEFHUCBmb3IgZXhhbXBsZSBkb2Vzbid0IGhhdmUgYSBkbWFfYWRkcmVzcyBhcnJheS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5j
IHwgNCArKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+ID4gaW5kZXgg
M2UwOWRmMDQ3MmNlLi4xNzBhYmE5OWExMTAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYwo+ID4gQEAgLTU0Niw3ICs1NDYsNyBAQCBub3V2ZWF1X2JvX3N5bmNfZm9y
X2RldmljZShzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibykKPiA+ICAgICAgIHN0cnVjdCB0dG1fdHQg
KnR0bV9kbWEgPSAoc3RydWN0IHR0bV90dCAqKW52Ym8tPmJvLnR0bTsKPiA+ICAgICAgIGludCBp
LCBqOwo+ID4KPiA+IC0gICAgIGlmICghdHRtX2RtYSkKPiA+ICsgICAgIGlmICghdHRtX2RtYSB8
fCAhdHRtX2RtYS0+ZG1hX2FkZHJlc3MpCj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+ICAg
ICAgIGlmICghdHRtX2RtYS0+cGFnZXMpIHsKPiA+ICAgICAgICAgICAgICAgTlZfREVCVUcoZHJt
LCAidHRtX2RtYSAweCVwOiBwYWdlcyBOVUxMXG4iLCB0dG1fZG1hKTsKPiA+IEBAIC01ODIsNyAr
NTgyLDcgQEAgbm91dmVhdV9ib19zeW5jX2Zvcl9jcHUoc3RydWN0IG5vdXZlYXVfYm8gKm52Ym8p
Cj4gPiAgICAgICBzdHJ1Y3QgdHRtX3R0ICp0dG1fZG1hID0gKHN0cnVjdCB0dG1fdHQgKiludmJv
LT5iby50dG07Cj4gPiAgICAgICBpbnQgaSwgajsKPiA+Cj4gPiAtICAgICBpZiAoIXR0bV9kbWEp
Cj4gPiArICAgICBpZiAoIXR0bV9kbWEgfHwgIXR0bV9kbWEtPmRtYV9hZGRyZXNzKQo+ID4gICAg
ICAgICAgICAgICByZXR1cm47Cj4gPiAgICAgICBpZiAoIXR0bV9kbWEtPnBhZ2VzKSB7Cj4gPiAg
ICAgICAgICAgICAgIE5WX0RFQlVHKGRybSwgInR0bV9kbWEgMHglcDogcGFnZXMgTlVMTFxuIiwg
dHRtX2RtYSk7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
