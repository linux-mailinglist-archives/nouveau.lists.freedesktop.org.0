Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C9E17AAB1
	for <lists+nouveau@lfdr.de>; Thu,  5 Mar 2020 17:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8096E369;
	Thu,  5 Mar 2020 16:41:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334C06E0DF
 for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2020 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583426470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kIsvqWk31aJbz76bO7J59CH2eDqVdpvFmO7cKoNTj4=;
 b=a1CbPGvp0bdBAk3KgQXL7CPI+xmpFbD+sCg43K0RRdttqvBRltVT58aF5mrfhY8zFJX7iA
 dB3kYYxUGKJ1y0I+Fktx+AJZuntiCZkBNIaoKldE2G5mn+qPUEoo3jNEajxTScc32o8EWN
 8i/W87bXEhB5kzoI7OuzrknD355Fa40=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-EWkxFyedNBe0hpDikYp-0w-1; Thu, 05 Mar 2020 11:41:07 -0500
X-MC-Unique: EWkxFyedNBe0hpDikYp-0w-1
Received: by mail-wm1-f70.google.com with SMTP id d129so2303822wmd.2
 for <nouveau@lists.freedesktop.org>; Thu, 05 Mar 2020 08:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=stJeKdSC+Wyig8nOc8URVbuDCJaVJQbI9Q0Eokb7KMg=;
 b=HmMCTL949JhuBeei+Q3i+29Ms96KMjOJMX8L7/2a4PFQEmfZFIcem1FlnJZIPf4z5X
 x3zBgJjxAID1QvmyBDYfTo5ERCLhIioiGDfNMOtoF3fNNMTYlEN1wkJ7Fz/0Kpr7HaIj
 6a1x9G+tVNPM88+ElSLnWYClMdGxhhgWOmMUhRTZNpCC5P6UupYMU/fGTmIxct4RziiO
 wcmkYXJyJWTRMk3woeNCbSBM+/ih9w9/QpJqbSzQWf2NCy9VWFwAcf3jt0TU0BhLlVr4
 YsgjKM6RdK0HT+3ZeAv+hDp8KsX2O6GXKYbmsHQ6OwlITEUSIv93EDyAUAqQPXEKgLwp
 ydNw==
X-Gm-Message-State: ANhLgQ0to0ILaBDeT7SqfPwfICK45dB/NBpNvKz/pU6NQTsXv+syap/v
 8u7vLv2gmG+N9+NNFFbZJ3s6ar2QUn7I08kFnRZ4Cy9HUYVHNWcGIQE6ZUMkAdvVrenqoQsPRMj
 /9UzW/Dv8BBUWX585MidoAzTz2w==
X-Received: by 2002:adf:aa9e:: with SMTP id h30mr11559458wrc.288.1583426466394; 
 Thu, 05 Mar 2020 08:41:06 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvIRURKAgOSIvMEgAlaIX1+gfcD5nWklGx0bgkXynnCMfd09Tx4Bg7BqopFIY/UJQ2dyoc+DQ==
X-Received: by 2002:adf:aa9e:: with SMTP id h30mr11559440wrc.288.1583426466108; 
 Thu, 05 Mar 2020 08:41:06 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id w8sm11151809wmm.0.2020.03.05.08.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 08:41:05 -0800 (PST)
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20200304223614.312023-1-lyude@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <89275eb6-662d-73d1-a593-8271df5aadc0@redhat.com>
Date: Thu, 5 Mar 2020 17:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304223614.312023-1-lyude@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 0/3] drm/dp_mst: Fix bandwidth checking
 regressions from DSC patches
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgTHl1ZGUsCgpPbiAzLzQvMjAgMTE6MzYgUE0sIEx5dWRlIFBhdWwgd3JvdGU6Cj4gQU1EJ3Mg
cGF0Y2ggc2VyaWVzIGZvciBhZGRpbmcgRFNDIHN1cHBvcnQgdG8gdGhlIE1TVCBoZWxwZXJzCj4g
dW5mb3J0dW5hdGVseSBpbnRyb2R1Y2VkIGEgZmV3IHJlZ3Jlc3Npb25zIGludG8gdGhlIGtlcm5l
bCB0aGF0IEkgZGlkbid0Cj4gZ2V0IGFyb3VuZCB0byBmaXhpbmcgdW50aWwganVzdCBub3cuIEkg
d291bGQgaGF2ZSByZXZlcnRlZCB0aGUgY2hhbmdlcwo+IGVhcmxpZXIsIGJ1dCBzZWVpbmcgYXMg
dGhhdCB3b3VsZCBoYXZlIHJldmVydGVkIGFsbCBvZiBhbWQncyBEU0Mgc3VwcG9ydAo+ICsgZXZl
cnl0aGluZyB0aGF0IHdhcyBkb25lIG9uIHRvcCBvZiB0aGF0IEkgcmVhbGxsbGxseSB3YW50ZWQg
dG8gYXZvaWQKPiBkb2luZyB0aGF0Lgo+IAo+IEFueXdheSwgdGhpcyBzaG91bGQgZml4IGV2ZXJ5
dGhpbmcgYXMgZmFyIGFzIEkgY2FuIHRlbGwuIE5vdGUgdGhhdCBJCj4gZG9uJ3QgaGF2ZSBhbnkg
RFNDIGRpc3BsYXlzIGxvY2FsbHkgeWV0LCBzbyBpZiBzb21lb25lIGZyb20gQU1EIGNvdWxkCj4g
c2FuaXR5IGNoZWNrIHRoaXMgSSB3b3VsZCBhcHByZWNpYXRlIGl0IOKZpS4KClRoYW5rIHlvdSBm
b3IgdHJ5aW5nIHRvIGZpeCB0aGlzLCB1bmZvcnR1bmF0ZWx5IGZvciBtZSB0aGlzIGlzIG5vdCBm
aXhlZCwKd2l0aCB0aGlzIHNlcmllcy4gTXkgc2V0dXA6Cgo1LjYtcmM0ICsgeW91ciAzIHBhdGNo
ZXMgKCsgc29tZSB1bnJlbGF0ZWQgcGF0Y2hlcyBvdXRzaWRlIG9mIGRybSkKCi1MZW5vdm8geDEg
N3RoIGdlbiArCiAgTGVub3ZvIFRCMyBkb2NrIGdlbiAyICsKICAyIGV4dGVybmFsIDE5MjB4MTA4
MEA2MCBtb25pdG9ycyBjb25uZWN0ZWQgdG8gdGhlIDIgSERNSSBpbnRlcmZhY2VzIG9uIHRoZSBk
b2NrCi1TeXN0ZW0gYm9vdGVkIHdpdGggdGhlIExJRCBjbG9zZWQsIHNvIHRoYXQgdGhlIGZpcm13
YXJlL0JJT1MgaGFzIGFscmVhZHkKICBpbml0aWFsaXplZCBib3RoIG1vbml0b3JzIHdoZW4gdGhl
IGtlcm5lbCBib290cwoKVGhpcyBzaG91bGQgYmUgZmFpcmx5IGVhc3kgdG8gcmVwcm9kdWNlIG9u
IGEgc2ltaWxhciBzZXR1cCwgb3RoZXIKdXNlcnMgYXJlIHNlZWluZyBzaW1pbGFyIHByb2JsZW1z
IHdoZW4gY29ubmVjdGluZyBtb3JlIHRoZW4gMSBtb25pdG9yCnRvIERQLU1TVCBkb2Nrcywgc2Vl
IGUuZy4gOgoKaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xODA5
NjgxCmh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTgxMDA3MAoK
TGV0IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8gY29sbGVjdCBzb21lIGRybS5kZWJ1ZyBsb2dz
LCBJIGd1ZXNzCmlmIHlvdSBkbywgeW91IHdhbnQgbWUgdG8gdXNlIGRybS5kZWJ1Zz0weDExNCA/
CgpSZWdhcmRzLAoKSGFucwoKCgoKCj4gCj4gQ2M6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBz
a2lAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+IENjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGdvb2dsZS5jb20+Cj4gQ2M6IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gCj4gTHl1ZGUgUGF1bCAoMyk6Cj4gICAgZHJtL2Rw
X21zdDogUmVuYW1lIGRybV9kcF9tc3RfaXNfZHBfbXN0X2VuZF9kZXZpY2UoKSB0byBiZSBsZXNz
Cj4gICAgICByZWR1bmRhbnQKPiAgICBkcm0vZHBfbXN0OiBEb24ndCBzaG93IGNvbm5lY3RvcnMg
YXMgY29ubmVjdGVkIGJlZm9yZSBwcm9iaW5nCj4gICAgICBhdmFpbGFibGUgUEJOCj4gICAgZHJt
L2RwX21zdDogUmV3cml0ZSBhbmQgZml4IGJhbmR3aWR0aCBsaW1pdCBjaGVja3MKPiAKPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxMjQgKysrKysrKysrKysrKysr
KysrKystLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCAyOCBkZWxl
dGlvbnMoLSkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
