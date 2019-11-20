Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5D103EE7
	for <lists+nouveau@lfdr.de>; Wed, 20 Nov 2019 16:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BBD89350;
	Wed, 20 Nov 2019 15:37:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F7A89350
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 15:37:30 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-GlK9gKM8Mnu9e_q_avS-hw-1; Wed, 20 Nov 2019 10:37:26 -0500
Received: by mail-qk1-f197.google.com with SMTP id k145so16052935qke.11
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 07:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BksgvfivWT5oEKOsVtU2jjsSwTJ8rcltyxFUj+I5xNY=;
 b=mouGZyrMJF4F8J15cuT0JeM0LAnzxlVHFRa8sz6oQPYN/v3vK2y1w/Ms9V7mJRKN6O
 dpMDCoqjIKomoz16EfD78A7ErPDVufMome7bCfacjt0/eEeLOXYtPDkii7W8SnMWC6tv
 44sY9plbAPIEs0BSlBZua/hatKtTkgFYK4jqdLn9yL84hOdrC94VR8YOBpq7bGZ2y4mn
 on1MHvCK9BdjVwh9r+1UP0LX9PwQoI6v3ih7hGPHCvCskZVylqB80UGilAsSeC5Atvvz
 Aahx94G1L0EbN+WU2GFMlwqYZmyZ8X0bdP3B+Mw6ZI3O1GVf6JDBXplqjmZeMonlK6My
 L6PA==
X-Gm-Message-State: APjAAAUGilJGOOYnBEQRIup4zG/tffKUkXgJ6+T4/HwJny1UmHhbi0VK
 oKPvw/5zVzCvMNJLB9g+peLHHlx/pPNJ50GVn7JcsT7M1dKdPZPy0dGuGhg8iXYYZnPJkptDReV
 GajfUArB5lFZSqbjKSD7WB8HFsRZBy606wExToONvwg==
X-Received: by 2002:a37:6811:: with SMTP id d17mr3082054qkc.102.1574264245967; 
 Wed, 20 Nov 2019 07:37:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzt0K/ijAMXYP756+k75llJT5zszZ47OfQZKFovlD4ZwaMaT169d/nRHiPSAwI9CqrdON3hSsUsT8pA85i0bCE=
X-Received: by 2002:a37:6811:: with SMTP id d17mr3082027qkc.102.1574264245623; 
 Wed, 20 Nov 2019 07:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
In-Reply-To: <20191120151542.GH11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 16:37:14 +0100
Message-ID: <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: GlK9gKM8Mnu9e_q_avS-hw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574264248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/C9gUt9cyA76AzLuivaEWyzrhcrqWJ0lBzJ30P+LXYs=;
 b=Qs8NmD3WjgP3ZR2VczZb/hBQbV/lN96aXwCJ9lsSIVz/vNsGr/PHu5RxoLrnPAXpSu32GB
 xHSevFESrANG/GhOIeAqYZcratqPioVS4bsdj3Mpp/feRT+FIiCbHbhUlkzLr3+7SW6iBd
 WG9m6xJiYkWie6Mu1ljGbU2wrTGc9tI=
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgNDoxNSBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6
MTE6NTJQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgMjAsIDIw
MTkgYXQgMTowOSBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTg6MDBQ
TSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+IG92ZXJhbGwsIHdoYXQgSSByZWFs
bHkgd2FudCB0byBrbm93IGlzLCBfd2h5XyBkb2VzIGl0IHdvcmsgb24gd2luZG93cz8KPiA+ID4K
PiA+ID4gU28gZG8gSSA7LSkKPiA+ID4KPiA+ID4gPiBPciB3aGF0IGFyZSB3ZSBkb2luZyBkaWZm
ZXJlbnRseSBvbiBMaW51eCBzbyB0aGF0IGl0IGRvZXNuJ3Qgd29yaz8gSWYKPiA+ID4gPiBhbnli
b2R5IGhhcyBhbnkgaWRlYSBvbiBob3cgd2UgY291bGQgZGlnIGludG8gdGhpcyBhbmQgZmlndXJl
IGl0IG91dAo+ID4gPiA+IG9uIHRoaXMgbGV2ZWwsIHRoaXMgd291bGQgcHJvYmFibHkgYWxsb3cg
dXMgdG8gZ2V0IGNsb3NlciB0byB0aGUgcm9vdAo+ID4gPiA+IGNhdXNlPyBubz8KPiA+ID4KPiA+
ID4gSGF2ZSB5b3UgdHJpZWQgdG8gdXNlIHRoZSBhY3BpX3Jldl9vdmVycmlkZSBwYXJhbWV0ZXIg
aW4geW91ciBzeXN0ZW0gYW5kCj4gPiA+IGRvZXMgaXQgaGF2ZSBhbnkgZWZmZWN0Pwo+ID4gPgo+
ID4gPiBBbHNvIGRpZCB5b3UgdHJ5IHRvIHRyYWNlIHRoZSBBQ1BJIF9PTi9fT0ZGKCkgbWV0aG9k
cz8gSSB0aGluayB0aGF0Cj4gPiA+IHNob3VsZCBob3BlZnVsbHkgcmV2ZWFsIHNvbWV0aGluZy4K
PiA+ID4KPiA+Cj4gPiBJIHRoaW5rIEkgZGlkIGluIHRoZSBwYXN0IGFuZCBpdCBzZWVtZWQgdG8g
aGF2ZSB3b3JrZWQsIHRoZXJlIGlzIGp1c3QKPiA+IG9uZSBiaWcgaXNzdWUgd2l0aCB0aGlzOiBp
dCdzIGEgRGVsbCBzcGVjaWZpYyB3b3JrYXJvdW5kIGFmYWlrLCBhbmQKPiA+IHRoaXMgaXNzdWUg
cGxhZ3VlcyBub3QganVzdCBEZWxsLCBidXQgd2UndmUgc2VlbiBpdCBvbiBIUCBhbmQgTGVub3Zv
Cj4gPiBsYXB0b3BzIGFzIHdlbGwsIGFuZCBJJ3ZlIGhlYXJkIGFib3V0IHVzZXJzIGhhdmluZyB0
aGUgc2FtZSBpc3N1ZXMgb24KPiA+IEFzdXMgYW5kIE1TSSBsYXB0b3BzIGFzIHdlbGwuCj4KPiBN
YXliZSBpdCBpcyBub3QgYSB3b3JrYXJvdW5kIGF0IGFsbCBidXQgaW5zdGVhZCBpdCBzaW1wbHkg
ZGV0ZXJtaW5lcwo+IHdoZXRoZXIgdGhlIHN5c3RlbSBzdXBwb3J0cyBSVEQzIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQgKElJUkMgV2luZG93cyA4Cj4gc3RhcnRlZCBzdXBwb3J0aW5nIGl0KS4gTWF5
YmUgRGVsbCBhZGRlZCBjaGVjayBmb3IgTGludXggYmVjYXVzZSBhdCB0aGF0Cj4gdGltZSBMaW51
eCBkaWQgbm90IHN1cHBvcnQgaXQuCj4KCnRoZSBwb2ludCBpcywgaXQncyBub3QgY2hlY2tpbmcg
aXQgYnkgZGVmYXVsdCwgc28gYnkgZGVmYXVsdCB5b3Ugc3RpbGwKcnVuIGludG8gdGhlIHdpbmRv
d3MgOCBjb2RlcGF0aC4KCj4gSW4gY2FzZSBSVEQzIGlzIHN1cHBvcnRlZCBpdCBpbnZva2VzIExL
RFMoKSB3aGljaCBwcm9iYWJseSBkb2VzIHRoZSBMMgo+IG9yIEwzIGVudHJ5IGFuZCB0aGlzIGlz
IGZvciBzb21lIHJlYXNvbiBkb2VzIG5vdCB3b3JrIHRoZSBzYW1lIHdheSBpbgo+IExpbnV4IHRo
YW4gaXQgZG9lcyB3aXRoIFdpbmRvd3MgOCsuCj4KPiBJIGRvbid0IHJlbWVtYmVyIGlmIHRoaXMg
aGFwcGVucyBvbmx5IHdpdGggbm91dmVhdSBvciB3aXRoIHRoZQo+IHByb3ByaWV0YXJ5IGRyaXZl
ciBhcyB3ZWxsIGJ1dCBsb29raW5nIGF0IHRoZSBub3V2ZWF1IHJ1bnRpbWUgUE0gc3VzcGVuZAo+
IGhvb2sgKGFzc3VtaW5nIEknbSBsb29raW5nIGF0IHRoZSBjb3JyZWN0IGNvZGUpOgo+Cj4gc3Rh
dGljIGludAo+IG5vdXZlYXVfcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiB7Cj4gICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsK
PiAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBk
ZXYpOwo+ICAgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgaWYgKCFub3V2ZWF1X3Btb3BzX3J1
bnRpbWUoKSkgewo+ICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX2ZvcmJpZChkZXYpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBub3V2
ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKPiAgICAgICAgIHJldCA9IG5vdXZlYXVfZG9f
c3VzcGVuZChkcm1fZGV2LCB0cnVlKTsKPiAgICAgICAgIHBjaV9zYXZlX3N0YXRlKHBkZXYpOwo+
ICAgICAgICAgcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+ICAgICAgICAgcGNpX2lnbm9yZV9o
b3RwbHVnKHBkZXYpOwo+ICAgICAgICAgcGNpX3NldF9wb3dlcl9zdGF0ZShwZGV2LCBQQ0lfRDNj
b2xkKTsKPiAgICAgICAgIGRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hf
UE9XRVJfRFlOQU1JQ19PRkY7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+IH0KPgo+IE5vcm1hbGx5
IFBDSSBkcml2ZXJzIGxlYXZlIHRoZSBQQ0kgYnVzIFBNIHRoaW5ncyB0byBQQ0kgY29yZSBidXQg
aGVyZQo+IHRoZSBkcml2ZXIgZG9lcyB0aGVzZS4gU28gSSB3b25kZXIgaWYgaXQgbWFrZXMgYW55
IGRpZmZlcmVuY2UgaWYgd2UgbGV0Cj4gdGhlIGNvcmUgaGFuZGxlIGFsbCB0aGF0Ogo+Cj4gc3Rh
dGljIGludAo+IG5vdXZlYXVfcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiB7Cj4gICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsK
PiAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBk
ZXYpOwo+ICAgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgaWYgKCFub3V2ZWF1X3Btb3BzX3J1
bnRpbWUoKSkgewo+ICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX2ZvcmJpZChkZXYpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBub3V2
ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKPiAgICAgICAgIHJldCA9IG5vdXZlYXVfZG9f
c3VzcGVuZChkcm1fZGV2LCB0cnVlKTsKPiAgICAgICAgIHBjaV9pZ25vcmVfaG90cGx1ZyhwZGV2
KTsKPiAgICAgICAgIGRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hfUE9X
RVJfRFlOQU1JQ19PRkY7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+IH0KPgo+IGFuZCBzaW1pbGFy
IGZvciB0aGUgbm91dmVhdV9wbW9wc19ydW50aW1lX3Jlc3VtZSgpLgo+Cgp5ZWFoLCBJIHRyaWVk
IHRoYXQgYXQgc29tZSBwb2ludCBhbmQgaXQgZGlkbid0IGhlbHAgZWl0aGVyLiBUaGUgcmVhc29u
CndlIGNhbGwgdGhvc2UgZnJvbSBpbnNpZGUgTm91dmVhdSBpcyB0byBzdXBwb3J0IHN5c3RlbXMg
cHJlIF9QUiB3aGVyZQpub3V2ZWF1IGludm9rZXMgY3VzdG9tIF9EU00gY2FsbHMgb24gaXRzIG93
bi4gV2UgY291bGQgcG90ZW50aWFsbHkKY2hlY2sgZm9yIHRoYXQgdGhvdWdoLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
