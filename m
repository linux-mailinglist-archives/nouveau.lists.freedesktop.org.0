Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C32CD9E6
	for <lists+nouveau@lfdr.de>; Thu,  3 Dec 2020 16:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8836EB7E;
	Thu,  3 Dec 2020 15:12:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35586EB76
 for <nouveau@lists.freedesktop.org>; Thu,  3 Dec 2020 15:12:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so2208410wrb.9
 for <nouveau@lists.freedesktop.org>; Thu, 03 Dec 2020 07:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0hAERqPEvNo/njSkBdKsEcTHEsk1v0wP1n3wdDVxwRA=;
 b=ljuNo4eEahkgNmDeKtvAvfTssZ64Q6mjpQQoXt9tARSPJ/UKDZd2tm1WXVMtlDQO6e
 5cXSU0rQl9crCv1/MCMNkfFuFRg1gpULaVCYZJM9zx42cElkjvLcVg65WAE1rJtPwxxv
 KPUPBH5tzcuf7en6L4nPTg1Nwn1Xm8DQKwDVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0hAERqPEvNo/njSkBdKsEcTHEsk1v0wP1n3wdDVxwRA=;
 b=O08zrVdeSbH4KwFiQooAQB/wi7fljeSC0S7EUkmzSJoT1M8+t8a7jfSj+iJsd+mIUZ
 CaiYOPoF7hrAlbeRB2vFO7oRL5IyKMqMUmW76EBVkiDcpaOu319gtK5UhUNCN5+oxRSz
 BmJ6tJQ1GVhnGO6uoBhCp8norUP6Hz2kTIm5ZfDmfa5RgwSbz4Pk1xAKuQsPrkmdtiEE
 bJT7Ek72GVfzVLvdm9SO5wmCOo57Y6N0FO97Uq9KHd9TNpOXa7eaS3oz+zSDuTahgdsX
 eQgFUhAg7umY50kkx9WcQcQq5us/UYNweAnla6UOevn+kIEfW4VRga6cKwCr8Ufoc5OF
 i2VA==
X-Gm-Message-State: AOAM531FL6eDeazuJu64GpQRfKKflQip0y2x5XSU44eVUarYxy9aovjo
 qj6l9thhNw47SVIhcwd/h7VUhA==
X-Google-Smtp-Source: ABdhPJzR0mjbW0lUnsYIx2yd+IU0gKhYgWhujyXW3lp/unSp+504Q7xyi1/p6htVhQ/5dQ2lDnAy9w==
X-Received: by 2002:adf:c648:: with SMTP id u8mr4243506wrg.215.1607008344358; 
 Thu, 03 Dec 2020 07:12:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u23sm1845979wmc.32.2020.12.03.07.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 07:12:23 -0800 (PST)
Date: Thu, 3 Dec 2020 16:12:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Message-ID: <20201203151221.GA401619@phenom.ffwll.local>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
 <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
 <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
 <CAKMK7uFaCVLu9GWR0Jkvf8iXP4RdcG3TmMsLmFVDoERBOk1ZOQ@mail.gmail.com>
 <96A4A47D-4B6B-4038-B094-DD490B99C698@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96A4A47D-4B6B-4038-B094-DD490B99C698@vmware.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
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
Cc: Daniel Vetter <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDM6MDY6MjBBTSArMDAwMCwgWmFjayBSdXNpbiB3cm90
ZToKPiAKPiAKPiA+IE9uIERlYyAyLCAyMDIwLCBhdCAxMTowMywgRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+IAo+ID4gT24gV2VkLCBEZWMgMiwgMjAyMCBhdCA0OjM3
IFBNIFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+IHdyb3RlOgo+ID4+IAo+ID4+IAo+ID4+
IAo+ID4+PiBPbiBEZWMgMiwgMjAyMCwgYXQgMDk6MjcsIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiA+Pj4gCj4gPj4+IEhpCj4gPj4+IAo+ID4+PiBBbSAw
Mi4xMi4yMCB1bSAwOTowMSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4+Pj4gSGkKPiA+
Pj4+IEFtIDMwLjExLjIwIHVtIDIxOjU5IHNjaHJpZWIgWmFjayBSdXNpbjoKPiA+Pj4+PiAKPiA+
Pj4+PiAKPiA+Pj4+Pj4gT24gTm92IDI0LCAyMDIwLCBhdCAwNjozOCwgVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4+Pj4+PiAKPiA+Pj4+Pj4gVXNpbmcg
c3RydWN0IGRybV9kZXZpY2UucGRldiBpcyBkZXByZWNhdGVkLiBDb252ZXJ0IHZtd2dmeCB0byBz
dHJ1Y3QKPiA+Pj4+Pj4gZHJtX2RldmljZS5kZXYuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiA+
Pj4+Pj4gCj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+ID4+Pj4+PiBDYzogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZt
d2FyZS5jb20+Cj4gPj4+Pj4+IC0tLQo+ID4+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9jbWRidWYuYyB8ICA4ICsrKystLS0tCj4gPj4+Pj4+IGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jICAgIHwgMjcgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+Pj4+
Pj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZmIuYyAgICAgfCAgMiArLQo+ID4+Pj4+
IAo+ID4+Pj4+IFJldmlld2VkLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgo+ID4+
Pj4gQ291bGQgeW91IGFkZCB0aGlzIHBhdGNoIHRvIHRoZSB2bXdnZnggdHJlZT8KPiA+Pj4gCj4g
Pj4+IEFNRCBkZXZzIGluZGljYXRlZCB0aGF0IHRoZXknZCBwcmVmZXIgdG8gbWVyZ2UgdGhlIHBh
dGNoc2V0IHRyb3VnaCBkcm0tbWlzYy1uZXh0LiBJZiB5b3UncmUgT0sgd2l0aCB0aGF0LCBJJ2Qg
bWVyZ2UgdGhlIHZtd2dmeCBwYXRjaCB0aHJvdWdoIGRybS1taXNjLW5leHQgYXMgd2VsbC4KPiA+
PiAKPiA+PiBTb3VuZHMgZ29vZC4gSeKAmWxsIG1ha2Ugc3VyZSB0byByZWJhc2Ugb3VyIGxhdGVz
dCBwYXRjaCBzZXQgb24gdG9wIG9mIGl0IHdoZW4gaXTigJlzIGluLiBUaGFua3MhCj4gPiAKPiA+
IGJ0dyBpZiB5b3Ugd2FudCB0byBhdm9pZCBtdWx0aS10cmVlIGNvb3JkaW5hdGlvbiBoZWFkYWNo
ZXMsIHdlIGNhbgo+ID4gYWxzbyBtYW5hZ2Ugdm13Z2Z4IGluIGRybS1taXNjIGFuZCBnaXZlIHlv
dSAmIFJvbGFuZCBjb21taXQgcmlnaHRzCj4gPiB0aGVyZS4gVXAgdG8geW91LiBUaGVyZSBpcyBz
b21lIHNjcmlwdGluZyBpbnZvbHZlZCBmb3Igbm93IChidXQgSSBob3BlCj4gPiB3aGVuZXZlciB3
ZSBtb3ZlIHRvIGdpdGxhYiB3ZSBjb3VsZCBkbyB0aGUgY2hlY2tzIHNlcnZlci1zaWRlKToKPiAK
PiBJ4oCZZCBiZSBoYXBweSB0byB0YWtlIHlvdSB1cCBvbiB0aGF0LiBJIHdvdWxkIGxpa2UgdG8g
bW92ZSBhIGxvdCBtb3JlIG9mCj4gb3VyIGRldmVsb3BtZW50IGludG8gcHVibGljIHJlcG9zIGFu
ZCByZWR1Y2luZyB0aGUgYnVyZGVuIG9mIG1haW50YWluaW5nCj4gbXVsdGlwbGUgdHJlZXMgd291
bGQgaGVscC4gSXMgdGhlcmUgYSBsb3Qgb2YgY2hhbmdlcyB0byBkcm0gY29yZSB0aGF0Cj4gZG9l
c27igJl0IGdvIHRocm91Z2ggZHJtLW1pc2M/IE9yIGFsdGVybmF0aXZlbHkgaXMgZHJtLW1pc2Mg
b2Z0ZW4gcHVsbGluZwo+IGZyb20gTGludXPigJkgbWFzdGVyPyBJ4oCZbSB0cnlpbmcgdG8gZmln
dXJlIG91dCBob3cgbXVjaCB3b3VsZCBvdXIgbmVlZCB0bwo+IHJlYmFzZS9tZXJnZSBiZSByZWR1
Y2VkIGlmIHdlIGp1c3QgdXNlZCBkcm0tbWlzYy1uZXh0L2RybS1taXNjLWZpeGVzCj4gYmVjYXVz
ZSB0aGF0IHdvdWxkIGFsc28gYWxsb3cgbWUgdG8gcG9pbnQgc29tZSBpbnRlcm5hbCB0ZXN0aW5n
Cj4gaW5mcmFzdHJ1Y3R1cmUgYXQgaXQgYXMgd2VsbC4KCkkgdGhpbmsgbm93YWRheXMgcHJldHR5
IG11Y2ggYWxsIHRoZSBjcm9zcy1kcml2ZXIgd29yayBsYW5kcyB0aHJvdWdoCmRybS1taXNjLiBF
eGNlcHRpb24gaXMganVzdCBuZXcgc3R1ZmYgdGhhdCdzIG9ubHkgdXNlZCBieSBhIHNpbmdsZSBk
cml2ZXIuCgpGb3IgdGVzdGluZyB0aGVyZSdzIGFsc28gZHJtLXRpcCwgd2hpY2ggdHJpZXMgdG8g
cHVsbCBpdCBhbGwgdG9nZXRoZXIgKGJ1dAp5b3UgbWlnaHQgc3RpbGwgd2FudCB0byBwb2ludCB5
b3VyIENJIGF0IGJyYW5jaGVzKS4KCkFsc28gbm90ZSB0aGF0IGRybS1taXNjLW5leHQgZG9lc24n
dCBoYXZlIGEgbWVyZ2Ugd2luZG93IGZyZWV6ZSBwZXJpb2QKKHdpdGggaGF2ZSB0aGUgZHJtLW1p
c2MtbmV4dC1maXhlcyBicmFuY2ggZHVyaW5nIHRoYXQgdGltZSBmb3IgbWVyZ2UKd2luZG93IGZp
eGVzKSwgc28geW91IGNhbiB0cmVhdCBpdCBsaWtlIGEgbWFpbiBkZXZlbG9wbWVudCBicmFuY2gg
bGlrZQplLmcuIGluIG1lc2EsIHdpdGggdGhlIC1maXhlcyBicmFuY2hlcyBhcyB0aGUgcmVsZWFz
ZSBicmFuY2hlcy4gT25seQpkaWZmZXJlbmNlIGlzIHRoYXQgd2UgZG9uJ3QgY2hlcnJ5IHBpY2sg
cGF0Y2hlcyBmcm9tIHRoZSBtYWluIGJyYW5jaCB0bwp0aGUgcmVsZWFzZSBicmFuY2hlcyAoYXQg
bGVhc3Qgbm90IGFzIHRoZSBub3JtYWwgZmxvdykuCgpJZiB5b3UgZG8gbmVlZCBhIGJhY2ttZXJn
ZSBmb3IgcGF0Y2hlcyBmcm9tIExpbnVzIHRvIGRybS1taXNjLW5leHQgYmVjYXVzZQpvZiBzb21l
IGZlYXR1cmUgd29yayAob3IgY29uZmxpY3RzIHdpdGggb3RoZXIgc3R1ZmYgaW4gZ2VuZXJhbCkg
ZHJtLW1pc2MKbWFpbnRhaW5lcnMgZG8gdGhhdC4gVXN1YWxseSBoYXBwZW5zIGV2ZXJ5IGZldyB3
ZWVrcy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
