Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3EBCF660
	for <lists+nouveau@lfdr.de>; Tue,  8 Oct 2019 11:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7806E5FE;
	Tue,  8 Oct 2019 09:45:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FED6E2DF
 for <nouveau@lists.freedesktop.org>; Tue,  8 Oct 2019 09:45:49 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c4so15077599edl.0
 for <nouveau@lists.freedesktop.org>; Tue, 08 Oct 2019 02:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=hYgxJkx+pBGd9kRFsyzR+OY4RLbQ6G3BWXe0wHAJntU=;
 b=BcNC13lY84NfKdZzItjV4FBZQtflqbTbjcQ9rQCYfYm4xxnAiEkpKY4eNzea1hPYuj
 aSCsLAZHfazv1A4i24fMwelAHSkQxBTOb9gWf3tVuKUwo9/nGE8glUB2hApOeNR3hky2
 ETR7UWFq785wiB+i96SKVY2v0aG2XKooFZNfC8BUcohHSkqtrr9ysfUotRPJbwN6u8mv
 BYF1YY8lWy/Ckgp0N46AVWZ7kU2o3/O6zANAVUt5bIyN3ff6k/DgaPXuO4K21saKAR2q
 fLpXbxfdXAblBCf7h6cKiEKEYdwyFgOlRyohlyrAF7W8qESqyLT9fToQR/ABON3LNUfO
 litw==
X-Gm-Message-State: APjAAAXhzN8F9+L1dc45bBhwByr0BgXetJE4NTvNPipJVyGmQelQQc82
 ca6i6YzZKHXeVCNiIO23RNVL5Q==
X-Google-Smtp-Source: APXvYqxK3rZaAp9zf+OojF1Ta9JCxSdG66ES3UTYp5QjyhRj/Lbvtme8ZB3fuFqz6VPpe0sFgkvmfQ==
X-Received: by 2002:a17:906:81c6:: with SMTP id
 e6mr27550280ejx.284.1570527947558; 
 Tue, 08 Oct 2019 02:45:47 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q33sm3855245eda.60.2019.10.08.02.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 02:45:46 -0700 (PDT)
Date: Tue, 8 Oct 2019 11:45:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Message-ID: <20191008094544.GI16989@phenom.ffwll.local>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Juston Li <juston.li@intel.com>, Imre Deak <imre.deak@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-4-lyude@redhat.com>
 <20190925181644.GD218215@art_vandelay>
 <e9a2638663549d86779002e3616fc2e89f9c7028.camel@redhat.com>
 <20190927133107.GQ218215@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927133107.GQ218215@art_vandelay>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=hYgxJkx+pBGd9kRFsyzR+OY4RLbQ6G3BWXe0wHAJntU=;
 b=iXqBjAvQknVpVyxkOLISM/7xGC/DuSvIT3gfGEY9/zArucT8seMONtoRMFe7Sa3uTa
 k6PRQTnL60fb63Hy24xOsB+7Wv3eeORMgMjXQBhDzZNDTW+TNxI/r/J7dUl0Y6QWdrca
 JAatO75XRkX9kfV+pw797/j+r5ZsV4xmHSlxs=
Subject: Re: [Nouveau] [PATCH v2 03/27] drm/dp_mst: Destroy MSTBs
 asynchronously
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
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <hwentlan@amd.com>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDk6MzE6MDdBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDA0OjA4OjIyUE0gLTA0MDAsIEx5dWRlIFBhdWwg
d3JvdGU6Cj4gPiBPbiBXZWQsIDIwMTktMDktMjUgYXQgMTQ6MTYgLTA0MDAsIFNlYW4gUGF1bCB3
cm90ZToKPiA+ID4gT24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6NDFQTSAtMDQwMCwgTHl1
ZGUgUGF1bCB3cm90ZToKPiA+ID4gPiBXaGVuIHJlcHJvYmluZyBhbiBNU1QgdG9wb2xvZ3kgZHVy
aW5nIHJlc3VtZSwgd2UgaGF2ZSB0byBhY2NvdW50IGZvciB0aGUKPiA+ID4gPiBmYWN0IHRoYXQg
d2hpbGUgd2Ugd2VyZSBzdXNwZW5kZWQgaXQncyBwb3NzaWJsZSB0aGF0IG1zdGJzIG1heSBoYXZl
IGJlZW4KPiA+ID4gPiByZW1vdmVkIGZyb20gYW55IHBvcnRzIGluIHRoZSB0b3BvbG9neS4gU2lu
Y2UgaXRlcmF0aW5nIGRvd253YXJkcyBpbiB0aGUKPiA+ID4gPiB0b3BvbG9neSByZXF1aXJlcyB0
aGF0IHdlIGhvbGQgJm1nci0+bG9jaywgZGVzdHJveWluZyBNU1RCcyBmcm9tIHRoaXMKPiA+ID4g
PiBjb250ZXh0IHdvdWxkIHJlc3VsdCBpbiBhdHRlbXB0aW5nIHRvIGxvY2sgJm1nci0+bG9jayBh
IHNlY29uZCB0aW1lIGFuZAo+ID4gPiA+IGRlYWRsb2NraW5nLgo+ID4gPiA+IAo+ID4gPiA+IFNv
LCBmaXggdGhpcyBieSBmaXJzdCBtb3ZpbmcgZGVzdHJ1Y3Rpb24gb2YgTVNUQnMgaW50bwo+ID4g
PiA+IGRlc3Ryb3lfY29ubmVjdG9yX3dvcmssIHRoZW4gcmVuYW1lIGRlc3Ryb3lfY29ubmVjdG9y
X3dvcmsgYW5kIGZyaWVuZHMKPiA+ID4gPiB0byByZWZsZWN0IHRoYXQgdGhleSBub3cgZGVzdHJv
eSBib3RoIHBvcnRzIGFuZCBtc3Ricy4KPiA+ID4gPiAKPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIHYx
Ogo+ID4gPiA+ICogcy9kZXN0cm95X2Nvbm5lY3Rvcl9saXN0L2Rlc3Ryb3lfcG9ydF9saXN0Lwo+
ID4gPiA+ICAgcy9jb25uZWN0b3JfZGVzdHJveV9sb2NrL2RlbGF5ZWRfZGVzdHJveV9sb2NrLwo+
ID4gPiA+ICAgcy9jb25uZWN0b3JfZGVzdHJveV93b3JrL2RlbGF5ZWRfZGVzdHJveV93b3JrLwo+
ID4gPiA+ICAgcy9kcm1fZHBfZmluaXNoX2Rlc3Ryb3lfYnJhbmNoX2RldmljZS9kcm1fZHBfZGVs
YXllZF9kZXN0cm95X21zdGIvCj4gPiA+ID4gICBzL2RybV9kcF9maW5pc2hfZGVzdHJveV9wb3J0
L2RybV9kcF9kZWxheWVkX2Rlc3Ryb3lfcG9ydC8KPiA+ID4gPiAgIC0gZGFudmV0Cj4gPiA+ID4g
KiBVc2UgdHdvIGxvb3BzIGluIGRybV9kcF9kZWxheWVkX2Rlc3Ryb3lfd29yaygpIC0gZGFudmV0
Cj4gPiA+ID4gKiBCZXR0ZXIgZXhwbGFpbiB3aHkgd2UgbmVlZCB0byBkbyB0aGlzIC0gZGFudmV0
Cj4gPiA+ID4gKiBVc2UgY2FuY2VsX3dvcmtfc3luYygpIGluc3RlYWQgb2YgZmx1c2hfd29yaygp
IC0gZmx1c2hfd29yaygpIGRvZXNuJ3QKPiA+ID4gPiAgIGFjY291bnQgZm9yIHdvcmsgcmVxdWVp
bmcKPiA+ID4gPiAKPiA+ID4gPiBDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgo+
ID4gPiA+IENjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+ID4gQ2M6
IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgo+ID4gPiA+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KPiA+ID4gCj4gPiA+IFRvb2sgbWUgYSB3aGlsZSB0byBncm9rIHRo
aXMsIGFuZCBJJ20gc3RpbGwgbm90IDEwMCUgY29uZmlkZW50IG15IG1lbnRhbAo+ID4gPiBtb2Rl
bAo+ID4gPiBpcyBjb3JyZWN0LCBzbyBwbGVhc2UgYmVhciB3aXRoIG1lIHdoaWxlIEkgYXNrIHNp
bGx5IHF1ZXN0aW9ucyA6KQo+ID4gPiAKPiA+ID4gTm93IHRoYXQgdGhlIGRlc3Ryb3kgaXMgZGVs
YXllZCwgYW5kIHRoZSBwb3J0IHJlbWFpbnMgaW4gdGhlIHRvcG9sb2d5LCBpcyBpdAo+ID4gPiBw
b3NzaWJsZSB3ZSB3aWxsIHVuZGVyZmxvdyB0aGUgdG9wb2xvZ3kga3JlZiBieSBjYWxsaW5nIHB1
dF9tc3RiIG11bHRpcGxlCj4gPiA+IHRpbWVzPwo+ID4gPiBJdCBsb29rcyBsaWtlIHRoYXQgd291
bGQgcmVzdWx0IGluIGEgV0FSTiBmcm9tIHJlZmNvdW50LmMsIGFuZCB3b3VsZG4ndCBjYWxsCj4g
PiA+IHRoZQo+ID4gPiBkZXN0cm95IGZ1bmN0aW9uIG11bHRpcGxlIHRpbWVzLCBzbyB0aGF0J3Mg
bmljZSA6KQo+ID4gPiAKPiA+ID4gU2ltaWxhcmx5LCBpcyB0aGVyZSBhbnkgZGVmZW5zZSBhZ2Fp
bnN0IGNhbGxpbmcgZ2V0X21zdGIoKSBiZXR3ZWVuIGRlc3Ryb3koKQo+ID4gPiBhbmQKPiA+ID4g
dGhlIGRlbGF5ZWQgZGVzdHJveSB3b3JrZXIgcnVubmluZz8KPiA+ID4gCj4gPiBHb29kIHF1ZXN0
aW9uISBUaGVyZSdzIG9ubHkgb25lIGluc3RhbmNlIHdoZXJlIHdlIHVuY29uZGl0aW9uYWxseSBn
cmFiIGFuIE1TVEIKPiA+IHJlZiwgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdCgpLCBh
bmQgaW4gdGhhdCBsb2NhdGlvbiB3ZSdyZSBndWFyYW50ZWVkCj4gPiB0byBiZSB0aGUgb25seSBv
bmUgd2l0aCBhY2Nlc3MgdG8gdGhhdCBtc3RiIHVudGlsIHdlIGRyb3AgJm1nci0+bG9jay4KPiA+
IEV2ZXJ5d2hlcmUgZWxzZSB3ZSB1c2UgZHJtX2RwX21zdF90b3BvbG9neV90cnlfZ2V0X21zdGIo
KSwgd2hpY2ggdXNlcwo+ID4ga3JlZl9nZXRfdW5sZXNzX3plcm8oKSB0byBwcm90ZWN0IGFnYWlu
c3QgdGhhdCBraW5kIG9mIHNpdHVhdGlvbiAoYW5kIGZvcmNlcwo+ID4gdGhlIGNhbGxlciB0byBj
aGVjayB3aXRoIF9fbXVzdF9jaGVjaykKCkltbyB3b3VsZCBiZSBnb29kIHRvIGFkZCB0aGlzIHRv
IHRoZSBjb21taXQgbWVzc2FnZSB3aGVuIG1lcmdpbmcgYXMgYSBRJkEsCmp1c3QgZm9yIHRoZSBy
ZWNvcmQuIEF0IGxlYXN0IEkgbGlrZSB0byBkbyB0aGF0IHdpdGggdGhlCnNpbGx5LWJ1dC1uby1z
by1zaWxseSBxdWVzdGlvbnMgdGhhdCBjb21lIHVwIGluIHJldmlldy4KLURhbmllbAoKPiAKPiBB
d2Vzb21lLCB0aGFua3MgZm9yIHRoZSBicmVha2Rvd24hCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IAo+IAo+ID4gCj4gPiA+IFNlYW4KPiA+ID4gCj4g
PiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
fCAxNjIgKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiA+ID4gPiAgaW5jbHVkZS9kcm0vZHJt
X2RwX21zdF9oZWxwZXIuaCAgICAgICB8ICAyNiArKystLQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEyNyBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiA+IGluZGV4IDMw
NTRlYzYyMjUwNi4uNzM4ZjI2MGQ0YjE1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiA+ID4gQEAgLTExMTMsMzQgKzExMTMsMTcgQEAgc3Rh
dGljIHZvaWQKPiA+ID4gPiBkcm1fZHBfZGVzdHJveV9tc3RfYnJhbmNoX2RldmljZShzdHJ1Y3Qg
a3JlZiAqa3JlZikKPiA+ID4gPiAgCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiA9Cj4g
PiA+ID4gIAkJY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCwgdG9w
b2xvZ3lfa3JlZik7Cj4gPiA+ID4gIAlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
ciA9IG1zdGItPm1ncjsKPiA+ID4gPiAtCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQsICp0
bXA7Cj4gPiA+ID4gLQlib29sIHdha2VfdHggPSBmYWxzZTsKPiA+ID4gPiAgCj4gPiA+ID4gLQlt
dXRleF9sb2NrKCZtZ3ItPmxvY2spOwo+ID4gPiA+IC0JbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KHBvcnQsIHRtcCwgJm1zdGItPnBvcnRzLCBuZXh0KSB7Cj4gPiA+ID4gLQkJbGlzdF9kZWwoJnBv
cnQtPm5leHQpOwo+ID4gPiA+IC0JCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7
Cj4gPiA+ID4gLQl9Cj4gPiA+ID4gLQltdXRleF91bmxvY2soJm1nci0+bG9jayk7Cj4gPiA+ID4g
LQo+ID4gPiA+IC0JLyogZHJvcCBhbnkgdHggc2xvdHMgbXNnICovCj4gPiA+ID4gLQltdXRleF9s
b2NrKCZtc3RiLT5tZ3ItPnFsb2NrKTsKPiA+ID4gPiAtCWlmIChtc3RiLT50eF9zbG90c1swXSkg
ewo+ID4gPiA+IC0JCW1zdGItPnR4X3Nsb3RzWzBdLT5zdGF0ZSA9IERSTV9EUF9TSURFQkFORF9U
WF9USU1FT1VUOwo+ID4gPiA+IC0JCW1zdGItPnR4X3Nsb3RzWzBdID0gTlVMTDsKPiA+ID4gPiAt
CQl3YWtlX3R4ID0gdHJ1ZTsKPiA+ID4gPiAtCX0KPiA+ID4gPiAtCWlmIChtc3RiLT50eF9zbG90
c1sxXSkgewo+ID4gPiA+IC0JCW1zdGItPnR4X3Nsb3RzWzFdLT5zdGF0ZSA9IERSTV9EUF9TSURF
QkFORF9UWF9USU1FT1VUOwo+ID4gPiA+IC0JCW1zdGItPnR4X3Nsb3RzWzFdID0gTlVMTDsKPiA+
ID4gPiAtCQl3YWtlX3R4ID0gdHJ1ZTsKPiA+ID4gPiAtCX0KPiA+ID4gPiAtCW11dGV4X3VubG9j
aygmbXN0Yi0+bWdyLT5xbG9jayk7Cj4gPiA+ID4gKwlJTklUX0xJU1RfSEVBRCgmbXN0Yi0+ZGVz
dHJveV9uZXh0KTsKPiA+ID4gPiAgCj4gPiA+ID4gLQlpZiAod2FrZV90eCkKPiA+ID4gPiAtCQl3
YWtlX3VwX2FsbCgmbXN0Yi0+bWdyLT50eF93YWl0cSk7Cj4gPiA+ID4gLQo+ID4gPiA+IC0JZHJt
X2RwX21zdF9wdXRfbXN0Yl9tYWxsb2MobXN0Yik7Cj4gPiA+ID4gKwkvKgo+ID4gPiA+ICsJICog
VGhpcyBjYW4gZ2V0IGNhbGxlZCB1bmRlciBtZ3ItPm11dGV4LCBzbyB3ZSBuZWVkIHRvIHBlcmZv
cm0gdGhlCj4gPiA+ID4gKwkgKiBhY3R1YWwgZGVzdHJ1Y3Rpb24gb2YgdGhlIG1zdGIgaW4gYW5v
dGhlciB3b3JrZXIKPiA+ID4gPiArCSAqLwo+ID4gPiA+ICsJbXV0ZXhfbG9jaygmbWdyLT5kZWxh
eWVkX2Rlc3Ryb3lfbG9jayk7Cj4gPiA+ID4gKwlsaXN0X2FkZCgmbXN0Yi0+ZGVzdHJveV9uZXh0
LCAmbWdyLT5kZXN0cm95X2JyYW5jaF9kZXZpY2VfbGlzdCk7Cj4gPiA+ID4gKwltdXRleF91bmxv
Y2soJm1nci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOwo+ID4gPiA+ICsJc2NoZWR1bGVfd29yaygm
bWdyLT5kZWxheWVkX2Rlc3Ryb3lfd29yayk7Cj4gPiA+ID4gIH0KPiA+ID4gPiAgCj4gPiA+ID4g
IC8qKgo+ID4gPiA+IEBAIC0xMjU1LDEwICsxMjM4LDEwIEBAIHN0YXRpYyB2b2lkIGRybV9kcF9k
ZXN0cm95X3BvcnQoc3RydWN0IGtyZWYgKmtyZWYpCj4gPiA+ID4gIAkJCSAqIHdlIG1pZ2h0IGJl
IGhvbGRpbmcgdGhlIG1vZGVfY29uZmlnLm11dGV4Cj4gPiA+ID4gIAkJCSAqIGZyb20gYW4gRURJ
RCByZXRyaWV2YWwgKi8KPiA+ID4gPiAgCj4gPiA+ID4gLQkJCW11dGV4X2xvY2soJm1nci0+ZGVz
dHJveV9jb25uZWN0b3JfbG9jayk7Cj4gPiA+ID4gLQkJCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAm
bWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl9saXN0KTsKPiA+ID4gPiAtCQkJbXV0ZXhfdW5sb2NrKCZt
Z3ItPmRlc3Ryb3lfY29ubmVjdG9yX2xvY2spOwo+ID4gPiA+IC0JCQlzY2hlZHVsZV93b3JrKCZt
Z3ItPmRlc3Ryb3lfY29ubmVjdG9yX3dvcmspOwo+ID4gPiA+ICsJCQltdXRleF9sb2NrKCZtZ3It
PmRlbGF5ZWRfZGVzdHJveV9sb2NrKTsKPiA+ID4gPiArCQkJbGlzdF9hZGQoJnBvcnQtPm5leHQs
ICZtZ3ItPmRlc3Ryb3lfcG9ydF9saXN0KTsKPiA+ID4gPiArCQkJbXV0ZXhfdW5sb2NrKCZtZ3It
PmRlbGF5ZWRfZGVzdHJveV9sb2NrKTsKPiA+ID4gPiArCQkJc2NoZWR1bGVfd29yaygmbWdyLT5k
ZWxheWVkX2Rlc3Ryb3lfd29yayk7Cj4gPiA+ID4gIAkJCXJldHVybjsKPiA+ID4gPiAgCQl9Cj4g
PiA+ID4gIAkJLyogbm8gbmVlZCB0byBjbGVhbiB1cCB2Y3BpCj4gPiA+ID4gQEAgLTI3OTIsNyAr
Mjc3NSw3IEBAIHZvaWQgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc3VzcGVuZChzdHJ1Y3QKPiA+
ID4gPiBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQo+ID4gPiA+ICAJCQkgICBEUF9NU1Rf
RU4gfCBEUF9VUFNUUkVBTV9JU19TUkMpOwo+ID4gPiA+ICAJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxv
Y2spOwo+ID4gPiA+ICAJZmx1c2hfd29yaygmbWdyLT53b3JrKTsKPiA+ID4gPiAtCWZsdXNoX3dv
cmsoJm1nci0+ZGVzdHJveV9jb25uZWN0b3Jfd29yayk7Cj4gPiA+ID4gKwlmbHVzaF93b3JrKCZt
Z3ItPmRlbGF5ZWRfZGVzdHJveV93b3JrKTsKPiA+ID4gPiAgfQo+ID4gPiA+ICBFWFBPUlRfU1lN
Qk9MKGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3N1c3BlbmQpOwo+ID4gPiA+ICAKPiA+ID4gPiBA
QCAtMzc0MCwzNCArMzcyMywxMDQgQEAgc3RhdGljIHZvaWQgZHJtX2RwX3R4X3dvcmsoc3RydWN0
IHdvcmtfc3RydWN0Cj4gPiA+ID4gKndvcmspCj4gPiA+ID4gIAltdXRleF91bmxvY2soJm1nci0+
cWxvY2spOwo+ID4gPiA+ICB9Cj4gPiA+ID4gIAo+ID4gPiA+IC1zdGF0aWMgdm9pZCBkcm1fZHBf
ZGVzdHJveV9jb25uZWN0b3Jfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gPiA+ID4g
K3N0YXRpYyBpbmxpbmUgdm9pZAo+ID4gPiA+ICtkcm1fZHBfZGVsYXllZF9kZXN0cm95X3BvcnQo
c3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKPiA+ID4gPiAgewo+ID4gPiA+IC0Jc3RydWN0
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0
Cj4gPiA+ID4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3IsIGRlc3Ryb3lfY29ubmVjdG9yX3dvcmsp
Owo+ID4gPiA+IC0Jc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKPiA+ID4gPiAtCWJvb2wg
c2VuZF9ob3RwbHVnID0gZmFsc2U7Cj4gPiA+ID4gKwlwb3J0LT5tZ3ItPmNicy0+ZGVzdHJveV9j
b25uZWN0b3IocG9ydC0+bWdyLCBwb3J0LT5jb25uZWN0b3IpOwo+ID4gPiA+ICsKPiA+ID4gPiAr
CWRybV9kcF9wb3J0X3RlYXJkb3duX3BkdChwb3J0LCBwb3J0LT5wZHQpOwo+ID4gPiA+ICsJcG9y
dC0+cGR0ID0gRFBfUEVFUl9ERVZJQ0VfTk9ORTsKPiA+ID4gPiArCj4gPiA+ID4gKwlkcm1fZHBf
bXN0X3B1dF9wb3J0X21hbGxvYyhwb3J0KTsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiAr
c3RhdGljIGlubGluZSB2b2lkCj4gPiA+ID4gK2RybV9kcF9kZWxheWVkX2Rlc3Ryb3lfbXN0Yihz
dHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIpCj4gPiA+ID4gK3sKPiA+ID4gPiArCXN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyID0gbXN0Yi0+bWdyOwo+ID4gPiA+ICsJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwgKnRtcDsKPiA+ID4gPiArCWJvb2wgd2FrZV90eCA9
IGZhbHNlOwo+ID4gPiA+ICsKPiA+ID4gPiArCW11dGV4X2xvY2soJm1nci0+bG9jayk7Cj4gPiA+
ID4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocG9ydCwgdG1wLCAmbXN0Yi0+cG9ydHMsIG5l
eHQpIHsKPiA+ID4gPiArCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7Cj4gPiA+ID4gKwkJZHJtX2Rw
X21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsKPiA+ID4gPiArCX0KPiA+ID4gPiArCW11dGV4
X3VubG9jaygmbWdyLT5sb2NrKTsKPiA+ID4gPiArCj4gPiA+ID4gKwkvKiBkcm9wIGFueSB0eCBz
bG90cyBtc2cgKi8KPiA+ID4gPiArCW11dGV4X2xvY2soJm1zdGItPm1nci0+cWxvY2spOwo+ID4g
PiA+ICsJaWYgKG1zdGItPnR4X3Nsb3RzWzBdKSB7Cj4gPiA+ID4gKwkJbXN0Yi0+dHhfc2xvdHNb
MF0tPnN0YXRlID0gRFJNX0RQX1NJREVCQU5EX1RYX1RJTUVPVVQ7Cj4gPiA+ID4gKwkJbXN0Yi0+
dHhfc2xvdHNbMF0gPSBOVUxMOwo+ID4gPiA+ICsJCXdha2VfdHggPSB0cnVlOwo+ID4gPiA+ICsJ
fQo+ID4gPiA+ICsJaWYgKG1zdGItPnR4X3Nsb3RzWzFdKSB7Cj4gPiA+ID4gKwkJbXN0Yi0+dHhf
c2xvdHNbMV0tPnN0YXRlID0gRFJNX0RQX1NJREVCQU5EX1RYX1RJTUVPVVQ7Cj4gPiA+ID4gKwkJ
bXN0Yi0+dHhfc2xvdHNbMV0gPSBOVUxMOwo+ID4gPiA+ICsJCXdha2VfdHggPSB0cnVlOwo+ID4g
PiA+ICsJfQo+ID4gPiA+ICsJbXV0ZXhfdW5sb2NrKCZtc3RiLT5tZ3ItPnFsb2NrKTsKPiA+ID4g
PiArCj4gPiA+ID4gKwlpZiAod2FrZV90eCkKPiA+ID4gPiArCQl3YWtlX3VwX2FsbCgmbXN0Yi0+
bWdyLT50eF93YWl0cSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJZHJtX2RwX21zdF9wdXRfbXN0Yl9t
YWxsb2MobXN0Yik7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyB2b2lkIGRy
bV9kcF9kZWxheWVkX2Rlc3Ryb3lfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gPiA+
ID4gK3sKPiA+ID4gPiArCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyID0KPiA+
ID4gPiArCQljb250YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
LAo+ID4gPiA+ICsJCQkgICAgIGRlbGF5ZWRfZGVzdHJveV93b3JrKTsKPiA+ID4gPiArCWJvb2wg
c2VuZF9ob3RwbHVnID0gZmFsc2UsIGdvX2FnYWluOwo+ID4gPiA+ICsKPiA+ID4gPiAgCS8qCj4g
PiA+ID4gIAkgKiBOb3QgYSByZWd1bGFyIGxpc3QgdHJhdmVyc2UgYXMgd2UgaGF2ZSB0byBkcm9w
IHRoZSBkZXN0cm95Cj4gPiA+ID4gLQkgKiBjb25uZWN0b3IgbG9jayBiZWZvcmUgZGVzdHJveWlu
ZyB0aGUgY29ubmVjdG9yLCB0byBhdm9pZCBBQi0+QkEKPiA+ID4gPiArCSAqIGNvbm5lY3RvciBs
b2NrIGJlZm9yZSBkZXN0cm95aW5nIHRoZSBtc3RiL3BvcnQsIHRvIGF2b2lkIEFCLT5CQQo+ID4g
PiA+ICAJICogb3JkZXJpbmcgYmV0d2VlbiB0aGlzIGxvY2sgYW5kIHRoZSBjb25maWcgbXV0ZXgu
Cj4gPiA+ID4gIAkgKi8KPiA+ID4gPiAtCWZvciAoOzspIHsKPiA+ID4gPiAtCQltdXRleF9sb2Nr
KCZtZ3ItPmRlc3Ryb3lfY29ubmVjdG9yX2xvY2spOwo+ID4gPiA+IC0JCXBvcnQgPSBsaXN0X2Zp
cnN0X2VudHJ5X29yX251bGwoJm1nci0+ZGVzdHJveV9jb25uZWN0b3JfbGlzdCwKPiA+ID4gPiBz
dHJ1Y3QgZHJtX2RwX21zdF9wb3J0LCBuZXh0KTsKPiA+ID4gPiAtCQlpZiAoIXBvcnQpIHsKPiA+
ID4gPiAtCQkJbXV0ZXhfdW5sb2NrKCZtZ3ItPmRlc3Ryb3lfY29ubmVjdG9yX2xvY2spOwo+ID4g
PiA+IC0JCQlicmVhazsKPiA+ID4gPiArCWRvIHsKPiA+ID4gPiArCQlnb19hZ2FpbiA9IGZhbHNl
Owo+ID4gPiA+ICsKPiA+ID4gPiArCQlmb3IgKDs7KSB7Cj4gPiA+ID4gKwkJCXN0cnVjdCBkcm1f
ZHBfbXN0X2JyYW5jaCAqbXN0YjsKPiA+ID4gPiArCj4gPiA+ID4gKwkJCW11dGV4X2xvY2soJm1n
ci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOwo+ID4gPiA+ICsJCQltc3RiID0gbGlzdF9maXJzdF9l
bnRyeV9vcl9udWxsKCZtZ3ItCj4gPiA+ID4gPmRlc3Ryb3lfYnJhbmNoX2RldmljZV9saXN0LAo+
ID4gPiA+ICsJCQkJCQkJc3RydWN0Cj4gPiA+ID4gZHJtX2RwX21zdF9icmFuY2gsCj4gPiA+ID4g
KwkJCQkJCQlkZXN0cm95X25leHQpOwo+ID4gPiA+ICsJCQlpZiAobXN0YikKPiA+ID4gPiArCQkJ
CWxpc3RfZGVsKCZtc3RiLT5kZXN0cm95X25leHQpOwo+ID4gPiA+ICsJCQltdXRleF91bmxvY2so
Jm1nci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOwo+ID4gPiA+ICsKPiA+ID4gPiArCQkJaWYgKCFt
c3RiKQo+ID4gPiA+ICsJCQkJYnJlYWs7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJCQlkcm1fZHBfZGVs
YXllZF9kZXN0cm95X21zdGIobXN0Yik7Cj4gPiA+ID4gKwkJCWdvX2FnYWluID0gdHJ1ZTsKPiA+
ID4gPiAgCQl9Cj4gPiA+ID4gLQkJbGlzdF9kZWwoJnBvcnQtPm5leHQpOwo+ID4gPiA+IC0JCW11
dGV4X3VubG9jaygmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl9sb2NrKTsKPiA+ID4gPiAgCj4gPiA+
ID4gLQkJbWdyLT5jYnMtPmRlc3Ryb3lfY29ubmVjdG9yKG1nciwgcG9ydC0+Y29ubmVjdG9yKTsK
PiA+ID4gPiArCQlmb3IgKDs7KSB7Cj4gPiA+ID4gKwkJCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQg
KnBvcnQ7Cj4gPiA+ID4gIAo+ID4gPiA+IC0JCWRybV9kcF9wb3J0X3RlYXJkb3duX3BkdChwb3J0
LCBwb3J0LT5wZHQpOwo+ID4gPiA+IC0JCXBvcnQtPnBkdCA9IERQX1BFRVJfREVWSUNFX05PTkU7
Cj4gPiA+ID4gKwkJCW11dGV4X2xvY2soJm1nci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOwo+ID4g
PiA+ICsJCQlwb3J0ID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZtZ3ItCj4gPiA+ID4gPmRl
c3Ryb3lfcG9ydF9saXN0LAo+ID4gPiA+ICsJCQkJCQkJc3RydWN0Cj4gPiA+ID4gZHJtX2RwX21z
dF9wb3J0LAo+ID4gPiA+ICsJCQkJCQkJbmV4dCk7Cj4gPiA+ID4gKwkJCWlmIChwb3J0KQo+ID4g
PiA+ICsJCQkJbGlzdF9kZWwoJnBvcnQtPm5leHQpOwo+ID4gPiA+ICsJCQltdXRleF91bmxvY2so
Jm1nci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOwo+ID4gPiA+ICsKPiA+ID4gPiArCQkJaWYgKCFw
b3J0KQo+ID4gPiA+ICsJCQkJYnJlYWs7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJCQlkcm1fZHBfZGVs
YXllZF9kZXN0cm95X3BvcnQocG9ydCk7Cj4gPiA+ID4gKwkJCXNlbmRfaG90cGx1ZyA9IHRydWU7
Cj4gPiA+ID4gKwkJCWdvX2FnYWluID0gdHJ1ZTsKPiA+ID4gPiArCQl9Cj4gPiA+ID4gKwl9IHdo
aWxlIChnb19hZ2Fpbik7Cj4gPiA+ID4gIAo+ID4gPiA+IC0JCWRybV9kcF9tc3RfcHV0X3BvcnRf
bWFsbG9jKHBvcnQpOwo+ID4gPiA+IC0JCXNlbmRfaG90cGx1ZyA9IHRydWU7Cj4gPiA+ID4gLQl9
Cj4gPiA+ID4gIAlpZiAoc2VuZF9ob3RwbHVnKQo+ID4gPiA+ICAJCWRybV9rbXNfaGVscGVyX2hv
dHBsdWdfZXZlbnQobWdyLT5kZXYpOwo+ID4gPiA+ICB9Cj4gPiA+ID4gQEAgLTM5NTcsMTIgKzQw
MTAsMTMgQEAgaW50IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2luaXQoc3RydWN0Cj4gPiA+ID4g
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiA+ID4gPiAgCW11dGV4X2luaXQoJm1nci0+
bG9jayk7Cj4gPiA+ID4gIAltdXRleF9pbml0KCZtZ3ItPnFsb2NrKTsKPiA+ID4gPiAgCW11dGV4
X2luaXQoJm1nci0+cGF5bG9hZF9sb2NrKTsKPiA+ID4gPiAtCW11dGV4X2luaXQoJm1nci0+ZGVz
dHJveV9jb25uZWN0b3JfbG9jayk7Cj4gPiA+ID4gKwltdXRleF9pbml0KCZtZ3ItPmRlbGF5ZWRf
ZGVzdHJveV9sb2NrKTsKPiA+ID4gPiAgCUlOSVRfTElTVF9IRUFEKCZtZ3ItPnR4X21zZ19kb3du
cSk7Cj4gPiA+ID4gLQlJTklUX0xJU1RfSEVBRCgmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl9saXN0
KTsKPiA+ID4gPiArCUlOSVRfTElTVF9IRUFEKCZtZ3ItPmRlc3Ryb3lfcG9ydF9saXN0KTsKPiA+
ID4gPiArCUlOSVRfTElTVF9IRUFEKCZtZ3ItPmRlc3Ryb3lfYnJhbmNoX2RldmljZV9saXN0KTsK
PiA+ID4gPiAgCUlOSVRfV09SSygmbWdyLT53b3JrLCBkcm1fZHBfbXN0X2xpbmtfcHJvYmVfd29y
ayk7Cj4gPiA+ID4gIAlJTklUX1dPUksoJm1nci0+dHhfd29yaywgZHJtX2RwX3R4X3dvcmspOwo+
ID4gPiA+IC0JSU5JVF9XT1JLKCZtZ3ItPmRlc3Ryb3lfY29ubmVjdG9yX3dvcmssCj4gPiA+ID4g
ZHJtX2RwX2Rlc3Ryb3lfY29ubmVjdG9yX3dvcmspOwo+ID4gPiA+ICsJSU5JVF9XT1JLKCZtZ3It
PmRlbGF5ZWRfZGVzdHJveV93b3JrLCBkcm1fZHBfZGVsYXllZF9kZXN0cm95X3dvcmspOwo+ID4g
PiA+ICAJaW5pdF93YWl0cXVldWVfaGVhZCgmbWdyLT50eF93YWl0cSk7Cj4gPiA+ID4gIAltZ3It
PmRldiA9IGRldjsKPiA+ID4gPiAgCW1nci0+YXV4ID0gYXV4Owo+ID4gPiA+IEBAIC00MDA1LDcg
KzQwNTksNyBAQCB2b2lkIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2Rlc3Ryb3koc3RydWN0Cj4g
PiA+ID4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikKPiA+ID4gPiAgewo+ID4gPiA+ICAJ
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdChtZ3IsIGZhbHNlKTsKPiA+ID4gPiAgCWZs
dXNoX3dvcmsoJm1nci0+d29yayk7Cj4gPiA+ID4gLQlmbHVzaF93b3JrKCZtZ3ItPmRlc3Ryb3lf
Y29ubmVjdG9yX3dvcmspOwo+ID4gPiA+ICsJY2FuY2VsX3dvcmtfc3luYygmbWdyLT5kZWxheWVk
X2Rlc3Ryb3lfd29yayk7Cj4gPiA+ID4gIAltdXRleF9sb2NrKCZtZ3ItPnBheWxvYWRfbG9jayk7
Cj4gPiA+ID4gIAlrZnJlZShtZ3ItPnBheWxvYWRzKTsKPiA+ID4gPiAgCW1nci0+cGF5bG9hZHMg
PSBOVUxMOwo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBl
ci5oCj4gPiA+ID4gYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gPiA+ID4gaW5k
ZXggZmMzNDkyMDRhNzFiLi40YTQ1MDdmZTkyOGQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmgKPiA+ID4gPiBAQCAtMTQzLDYgKzE0MywxMiBAQCBzdHJ1Y3QgZHJtX2Rw
X21zdF9icmFuY2ggewo+ID4gPiA+ICAJICovCj4gPiA+ID4gIAlzdHJ1Y3Qga3JlZiBtYWxsb2Nf
a3JlZjsKPiA+ID4gPiAgCj4gPiA+ID4gKwkvKioKPiA+ID4gPiArCSAqIEBkZXN0cm95X25leHQ6
IGxpbmtlZC1saXN0IGVudHJ5IHVzZWQgYnkKPiA+ID4gPiArCSAqIGRybV9kcF9kZWxheWVkX2Rl
c3Ryb3lfd29yaygpCj4gPiA+ID4gKwkgKi8KPiA+ID4gPiArCXN0cnVjdCBsaXN0X2hlYWQgZGVz
dHJveV9uZXh0Owo+ID4gPiA+ICsKPiA+ID4gPiAgCXU4IHJhZFs4XTsKPiA+ID4gPiAgCXU4IGxj
dDsKPiA+ID4gPiAgCWludCBudW1fcG9ydHM7Cj4gPiA+ID4gQEAgLTU3NSwxOCArNTgxLDI0IEBA
IHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciB7Cj4gPiA+ID4gIAlzdHJ1Y3Qgd29ya19z
dHJ1Y3QgdHhfd29yazsKPiA+ID4gPiAgCj4gPiA+ID4gIAkvKioKPiA+ID4gPiAtCSAqIEBkZXN0
cm95X2Nvbm5lY3Rvcl9saXN0OiBMaXN0IG9mIHRvIGJlIGRlc3Ryb3llZCBjb25uZWN0b3JzLgo+
ID4gPiA+ICsJICogQGRlc3Ryb3lfcG9ydF9saXN0OiBMaXN0IG9mIHRvIGJlIGRlc3Ryb3llZCBj
b25uZWN0b3JzLgo+ID4gPiA+ICsJICovCj4gPiA+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGRlc3Ry
b3lfcG9ydF9saXN0Owo+ID4gPiA+ICsJLyoqCj4gPiA+ID4gKwkgKiBAZGVzdHJveV9icmFuY2hf
ZGV2aWNlX2xpc3Q6IExpc3Qgb2YgdG8gYmUgZGVzdHJveWVkIGJyYW5jaAo+ID4gPiA+ICsJICog
ZGV2aWNlcy4KPiA+ID4gPiAgCSAqLwo+ID4gPiA+IC0Jc3RydWN0IGxpc3RfaGVhZCBkZXN0cm95
X2Nvbm5lY3Rvcl9saXN0Owo+ID4gPiA+ICsJc3RydWN0IGxpc3RfaGVhZCBkZXN0cm95X2JyYW5j
aF9kZXZpY2VfbGlzdDsKPiA+ID4gPiAgCS8qKgo+ID4gPiA+IC0JICogQGRlc3Ryb3lfY29ubmVj
dG9yX2xvY2s6IFByb3RlY3RzIEBjb25uZWN0b3JfbGlzdC4KPiA+ID4gPiArCSAqIEBkZWxheWVk
X2Rlc3Ryb3lfbG9jazogUHJvdGVjdHMgQGRlc3Ryb3lfcG9ydF9saXN0IGFuZAo+ID4gPiA+ICsJ
ICogQGRlc3Ryb3lfYnJhbmNoX2RldmljZV9saXN0Lgo+ID4gPiA+ICAJICovCj4gPiA+ID4gLQlz
dHJ1Y3QgbXV0ZXggZGVzdHJveV9jb25uZWN0b3JfbG9jazsKPiA+ID4gPiArCXN0cnVjdCBtdXRl
eCBkZWxheWVkX2Rlc3Ryb3lfbG9jazsKPiA+ID4gPiAgCS8qKgo+ID4gPiA+IC0JICogQGRlc3Ry
b3lfY29ubmVjdG9yX3dvcms6IFdvcmsgaXRlbSB0byBkZXN0cm95IGNvbm5lY3RvcnMuIE5lZWRl
ZCB0bwo+ID4gPiA+IC0JICogYXZvaWQgbG9ja2luZyBpbnZlcnNpb24uCj4gPiA+ID4gKwkgKiBA
ZGVsYXllZF9kZXN0cm95X3dvcms6IFdvcmsgaXRlbSB0byBkZXN0cm95IE1TVCBwb3J0IGFuZCBi
cmFuY2gKPiA+ID4gPiArCSAqIGRldmljZXMsIG5lZWRlZCB0byBhdm9pZCBsb2NraW5nIGludmVy
c2lvbi4KPiA+ID4gPiAgCSAqLwo+ID4gPiA+IC0Jc3RydWN0IHdvcmtfc3RydWN0IGRlc3Ryb3lf
Y29ubmVjdG9yX3dvcms7Cj4gPiA+ID4gKwlzdHJ1Y3Qgd29ya19zdHJ1Y3QgZGVsYXllZF9kZXN0
cm95X3dvcms7Cj4gPiA+ID4gIH07Cj4gPiA+ID4gIAo+ID4gPiA+ICBpbnQgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3JfaW5pdChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiA+
ID4gPiAtLSAKPiA+ID4gPiAyLjIxLjAKPiA+ID4gPiAKPiA+IC0tIAo+ID4gQ2hlZXJzLAo+ID4g
CUx5dWRlIFBhdWwKPiA+IAo+IAo+IC0tIAo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
