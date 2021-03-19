Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88D3418EA
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9926D6E9D1;
	Fri, 19 Mar 2021 09:57:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7C56E9D1
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3l3BfTP70gXS5Doqn0pw4lSC+ETHFzwyHhsUK4GEBKU=;
 b=XwMe7N+kCxM5o69fKNEdysvLmwQhBgqW5cdmn2Tu1nKxzIqp1SAWLQ60+zKnc0NOpO5YL5
 NIK95YJO7qlCcxag1dRoh8QXwSSSUutYy4Ot3iHGXXGghzypSzC4qj/WRmIeDefArH4UOp
 melELbVEj4Y0yIkP20x0r8FhKSPHkVo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-NNL3zxTtPDej8c4b6Az2DQ-1; Fri, 19 Mar 2021 05:57:00 -0400
X-MC-Unique: NNL3zxTtPDej8c4b6Az2DQ-1
Received: by mail-wm1-f70.google.com with SMTP id k132so2612370wma.1
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3l3BfTP70gXS5Doqn0pw4lSC+ETHFzwyHhsUK4GEBKU=;
 b=ONFI+Ex1PSBG4bXG/2cSH/ZjDW/azd3M3xIiWH5Z0+zeD5EHnKkKvD0vQRBGY76fLI
 hbqg78Xky/50xB/9yDvBMO+8qy5Jih38RF/gUVQIbg7y5WXTNBriir30iYrGGq8xHclB
 G9bV1Hm5MvTmO+SmN/OIADoGc9E2g7Mi2SknWLxtCGPIzXfR9Zvh2LUkVHwXBVS8Tkoh
 +f8AHbzWvuFKJNV5X4d5EOQojsCNCRUfvuKX94Ibt+cvZ9vC0r1iQglhT9CxxpjN/Jcb
 CJf09JuZ4RhQT41Z9sApItWeq9con4DmlPC/kr4vSzndiCwYgvV9+x/0BKgbH9cukEnQ
 p80g==
X-Gm-Message-State: AOAM530Uk7W7MeFhPoy1kmGgsz1ePTG/Lo2ZCqup1d1l/jTuaKdHq3rD
 uKWh+RIOMBKPwC4llzBN1+3L7nTUzawwgAAC1kZ+uOxEP8pE60lf3+P0gvsN3Exw8DMPoHUkkOg
 37R0o/l+/RQ9gf2DXi9CdPwbfdemszkXX8jR30/R9EA==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3638691wrv.10.1616147818278; 
 Fri, 19 Mar 2021 02:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydXZ7PTUXXk61n8Vm+NGA5deM8sQ8DWxF3xA9WDgrGsCesLVfERpF5oUV4xlX2RUpBfsYQ1O9Hc0Hb/dn7k7o=
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3638680wrv.10.1616147818103; 
 Fri, 19 Mar 2021 02:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-11-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-11-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:56:47 +0100
Message-ID: <CACO55tvYCgxXuqwoyXbVL50zLqPGQck_EjMxK_yePgG6tHnxKw@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 10/19] drm/nouveau/nouveau_bo: Remove unused
 variables 'dev'
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
Cc: Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMTksIDIwMjEgYXQgOToyNSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzogSW4g
ZnVuY3Rpb24g4oCYbm91dmVhdV90dG1fdHRfcG9wdWxhdGXigJk6Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYzoxMjI4OjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbi
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiDigJhub3V2ZWF1X3R0
bV90dF91bnBvcHVsYXRl4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jv
LmM6MTI1MjoxNzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0By
ZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gQ2M6IEplcmVteSBLb2xiIDxqa29sYkBicmFuZGVpcy5lZHU+Cj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCAyODFlOWVkMTM5ODk1Li45MTMw
MzVhYjg1ZWMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Ym8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IEBAIC0x
MjUwLDcgKzEyNTAsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Rldmlj
ZSAqYmRldiwKPiAgewo+ICAgICAgICAgc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICop
dHRtOwo+ICAgICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAgICAgICBzdHJ1Y3Qg
ZGV2aWNlICpkZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5wYWdlX2ZsYWdzICYg
VFRNX1BBR0VfRkxBR19TRyk7Cj4KPiAgICAgICAgIGlmICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0
bSkpCj4gQEAgLTEyNjMsNyArMTI2Miw2IEBAIG5vdXZlYXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVj
dCB0dG1fZGV2aWNlICpiZGV2LAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1
X2JkZXYoYmRldik7Cj4gLSAgICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICBy
ZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRybS0+dHRtLmJkZXYucG9vbCwgdHRtLCBjdHgpOwo+ICB9
Cj4gQEAgLTEyNzMsMTQgKzEyNzEsMTIgQEAgbm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1
Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0
dG1fdHQgKnR0bSkKPiAgewo+ICAgICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAg
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5w
YWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7Cj4KPiAgICAgICAgIGlmIChzbGF2ZSkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1X2JkZXYoYmRl
dik7Cj4gLSAgICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICByZXR1cm4gdHRt
X3Bvb2xfZnJlZSgmZHJtLT50dG0uYmRldi5wb29sLCB0dG0pOwo+ICB9Cj4gLS0KPiAyLjI3LjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
