Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4C105270
	for <lists+nouveau@lfdr.de>; Thu, 21 Nov 2019 13:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70316EE2F;
	Thu, 21 Nov 2019 12:53:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EAA6EE2F
 for <nouveau@lists.freedesktop.org>; Thu, 21 Nov 2019 12:53:16 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-S2a0U0E5Ntmp6AStWMCWbg-1; Thu, 21 Nov 2019 07:53:11 -0500
Received: by mail-qk1-f198.google.com with SMTP id r2so1911762qkb.2
 for <nouveau@lists.freedesktop.org>; Thu, 21 Nov 2019 04:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CEM0PnaeoKHLdOkLMiZXYw1vcMAsLpGiAJp9uLo00xA=;
 b=CceLF5Fr28zelLrlMeTYJFWOohuTbodd/jSmv/YXQw7B7PGQdFSRlxuWJCKImc/BBK
 8BQz1+Y1HKYY3bt0m3zH0fQ1GCy6Mar3zHqi/xb58rzR1SpxOxaN+PnCD9SCkMFiGNCW
 iQhYmORJBpKWBd/OzivI2kcsf6dwEMeIeSo6OhWIp/4E0zQHWTJGvuXMo7WUvJSsyu1j
 k+2HKGQ17rPwJTF7vUnjxKs28fjlYrdDQGXdRkWdZ1sc9Wdo9gqn+uZOz4rbjVEeD/aH
 vlCFyHUhFhKdnT219NQaQviIMuUAYj5bcWlyZVWPrk+PyMvCtMYhb1oBH9OjDe0XJWwr
 Kneg==
X-Gm-Message-State: APjAAAVutaZclowg5gpIl5vzJqYVpJBo5rfOE+J8EMbRBq3TGOEkkEEX
 CLQ8W2imt4B/Xi1GVfisv0d1xWMgRps5sJ8jRjpvZ2aoeH4iFWF8kBkwPfK8OUUjfx6A+LAfjpP
 XDVOYHmd8bn8MvrnccaqN1cIDo3L8Tah0OmpcNMUopw==
X-Received: by 2002:ac8:5557:: with SMTP id o23mr8377453qtr.378.1574340791041; 
 Thu, 21 Nov 2019 04:53:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqw52DQ6/+PFF1D7ZWko3HUNgikWPVpBkNz+T6JsTEqXPznpS5K5F7R1sz/hNMU3oG6dRHsmVibiYzYtcy2E5Vc=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr8377430qtr.378.1574340790766; 
 Thu, 21 Nov 2019 04:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
In-Reply-To: <20191121114610.GW11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 21 Nov 2019 13:52:57 +0100
Message-ID: <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: S2a0U0E5Ntmp6AStWMCWbg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574340795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYVd9Wx7thzZZDxf1X7Bt3zWOGy3VRzz5kqCnYWG4J0=;
 b=dnaSGB9CbIWLtgND5aCeA8ZOWXq+N0Bsbnr9eo7nSLS9hUe7Q0sYECTXIrQ3vNOvqg9DEx
 Tuu4L9Pf+UTue1kuhKUGlYwIj4VFGDyo85PCWlsKX5S1CtbdtdzN/3ejH6Di4YpWHLSVhR
 c4fRDXCETtw+4WHvGy/P0S46BC0ClXE=
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6NDYgUE0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEy
OjM0OjIyUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVGh1LCBOb3Yg
MjEsIDIwMTkgYXQgMTI6MjggUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA8bWlrYS53ZXN0ZXJiZXJn
QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEx
OjI5OjMzUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiA+ID4gbGFzdCB3
ZWVrIG9yIHNvIEkgZm91bmQgc3lzdGVtcyB3aGVyZSB0aGUgR1BVIHdhcyB1bmRlciB0aGUgIlBD
SQo+ID4gPiA+ID4gRXhwcmVzcyBSb290IFBvcnQiIChuYW1lIGZyb20gbHNwY2kpIGFuZCBvbiB0
aG9zZSBzeXN0ZW1zIGFsbCBvZiB0aGF0Cj4gPiA+ID4gPiBzZWVtcyB0byB3b3JrLiBTbyBJIGFt
IHdvbmRlcmluZyBpZiBpdCdzIGluZGVlZCBqdXN0IHRoZSAweDE5MDEgb25lLAo+ID4gPiA+ID4g
d2hpY2ggYWxzbyBleHBsYWlucyBNaWthcyBjYXNlIHRoYXQgVGh1bmRlcmJvbHQgc3R1ZmYgd29y
a3MgYXMgZGV2aWNlcwo+ID4gPiA+ID4gbmV2ZXIgZ2V0IHBvcHVsYXRlZCB1bmRlciB0aGlzIHBh
cnRpY3VsYXIgYnJpZGdlIGNvbnRyb2xsZXIsIGJ1dCB1bmRlcgo+ID4gPiA+ID4gdGhvc2UgIlJv
b3QgUG9ydCJzCj4gPiA+ID4KPiA+ID4gPiBJdCBhbHdheXMgaXMgYSBQQ0llIHBvcnQsIGJ1dCBp
dHMgbG9jYXRpb24gd2l0aGluIHRoZSBTb0MgbWF5IG1hdHRlci4KPiA+ID4KPiA+ID4gRXhhY3Rs
eS4gSW50ZWwgaGFyZHdhcmUgaGFzIFBDSWUgcG9ydHMgb24gQ1BVIHNpZGUgKHRoZXNlIGFyZSBj
YWxsZWQKPiA+ID4gUEVHLCBQQ0kgRXhwcmVzcyBHcmFwaGljcywgcG9ydHMpLCBhbmQgdGhlIFBD
SCBzaWRlLiBJIHRoaW5rIHRoZSBJUCBpcwo+ID4gPiBzdGlsbCB0aGUgc2FtZS4KPiA+ID4KCnll
YWgsIEkgbWVhbnQgdGhlIGJyaWRnZSBjb250cm9sbGVyIHdpdGggdGhlIElEIDB4MTkwMSBpcyBv
biB0aGUgQ1BVCnNpZGUuIEFuZCBpZiB0aGUgTnZpZGlhIEdQVSBpcyBvbiBhIHBvcnQgb24gdGhl
IFBDSCBzaWRlIGl0IGFsbCBzZWVtcwp0byB3b3JrIGp1c3QgZmluZS4KCj4gPiA+ID4gQWxzbyBz
b21lIGN1c3RvbSBBTUwtYmFzZWQgcG93ZXIgbWFuYWdlbWVudCBpcyBpbnZvbHZlZCBhbmQgdGhh
dCBtYXkKPiA+ID4gPiBiZSBtYWtpbmcgc3BlY2lmaWMgYXNzdW1wdGlvbnMgb24gdGhlIGNvbmZp
Z3VyYXRpb24gb2YgdGhlIFNvQyBhbmQgdGhlCj4gPiA+ID4gR1BVIGF0IHRoZSB0aW1lIG9mIGl0
cyBpbnZvY2F0aW9uIHdoaWNoIHVuZm9ydHVuYXRlbHkgYXJlIG5vdCBrbm93biB0bwo+ID4gPiA+
IHVzLgo+ID4gPiA+Cj4gPiA+ID4gSG93ZXZlciwgaXQgbG9va3MgbGlrZSB0aGUgQU1MIGludm9r
ZWQgdG8gcG93ZXIgZG93biB0aGUgR1BVIGZyb20KPiA+ID4gPiBhY3BpX3BjaV9zZXRfcG93ZXJf
c3RhdGUoKSBnZXRzIGNvbmZ1c2VkIGlmIGl0IGlzIG5vdCBpbiBQQ0kgRDAgYXQKPiA+ID4gPiB0
aGF0IHBvaW50LCBzbyBpdCBsb29rcyBsaWtlIHRoYXQgQU1MIHRyaWVzIHRvIGFjY2VzcyBkZXZp
Y2UgbWVtb3J5IG9uCj4gPiA+ID4gdGhlIEdQVSAoYmV5b25kIHRoZSBQQ0kgY29uZmlnIHNwYWNl
KSBvciBzaW1pbGFyIHdoaWNoIGlzIG5vdAo+ID4gPiA+IGFjY2Vzc2libGUgaW4gUENJIHBvd2Vy
IHN0YXRlcyBiZWxvdyBEMC4KPiA+ID4KPiA+ID4gT3IgdGhlIFBDSSBjb25maWcgc3BhY2Ugb2Yg
dGhlIEdQVSB3aGVuIHRoZSBwYXJlbnQgcm9vdCBwb3J0IGlzIGluIEQzaG90Cj4gPiA+IChhcyBp
dCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRoZSBHUFUgY29uZmlnIHNwYWNlIGlzIG5v
dAo+ID4gPiBhY2Nlc3NpYmxlLgo+ID4KPiA+IFdoeSB3b3VsZCB0aGUgcGFyZW50IHBvcnQgYmUg
aW4gRDNob3QgYXQgdGhhdCBwb2ludD8gIFdvdWxkbid0IHRoYXQgYmUKPiA+IGEgc3VzcGVuZCBv
cmRlcmluZyB2aW9sYXRpb24/Cj4KPiBOby4gV2UgcHV0IHRoZSBHUFUgaW50byBEM2hvdCBmaXJz
dCwgdGhlbiB0aGUgcm9vdCBwb3J0IGFuZCB0aGVuIHR1cm4KPiBvZmYgdGhlIHBvd2VyIHJlc291
cmNlICh3aGljaCBpcyBhdHRhY2hlZCB0byB0aGUgcm9vdCBwb3J0KSByZXN1bHRpbmcKPiB0aGUg
dG9wb2xvZ3kgZW50ZXJpbmcgRDNjb2xkLgo+CgpJZiB0aGUga2VybmVsIGRvZXMgYSBEMCAtPiBE
M2hvdCAtPiBEMCBjeWNsZSB0aGlzIHdvcmtzIGFzIHdlbGwsIGJ1dAp0aGUgcG93ZXIgc2F2aW5n
cyBhcmUgd2F5IGxvd2VyLCBzbyBJIGtpbmQgb2YgcHJlZmVyIHNraXBwaW5nIEQzaG90Cmluc3Rl
YWQgb2YgRDNjb2xkLiBTa2lwcGluZyBEM2hvdCBkb2Vzbid0IHNlZW0gdG8gbWFrZSBhbnkgZGlm
ZmVyZW5jZQppbiBwb3dlciBzYXZpbmdzIGluIG15IHRlc3RpbmcuCgo+ID4gPiBJIHRvb2sgYSBs
b29rIGF0IHRoZSBIUCBPbWVuIEFDUEkgdGFibGVzIHdoaWNoIGhhcyBzaW1pbGFyIHByb2JsZW0g
YW5kCj4gPiA+IHRoZXJlIGlzIGFsc28gY2hlY2sgZm9yIFdpbmRvd3MgNyAoYnV0IG5vdCBMaW51
eCkgc28gSSB0aGluayBvbmUKPiA+ID4gYWx0ZXJuYXRpdmUgd29ya2Fyb3VuZCB3b3VsZCBiZSB0
byBhZGQgdGhlc2UgZGV2aWNlcyBpbnRvCj4gPiA+IGFjcGlfb3NpX2RtaV90YWJsZVtdIHdoZXJl
IC5jYWxsYmFjayBpcyBzZXQgdG8gZG1pX2Rpc2FibGVfb3NpX3dpbjggKG9yCj4gPiA+IHBhc3Mg
J2FjcGlfb3NpPSIhV2luZG93cyAyMDEyIicgaW4gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUpLgo+
ID4KPiA+IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgdGhlIGZhY3RzIHRoYXQgaGF2ZSBiZWVuIGVz
dGFibGlzaGVkIHNvIGZhcgo+ID4gYmVmb3JlIGRlY2lkaW5nIHdoYXQgdG8gZG8gYWJvdXQgdGhl
bS4gOi0pCj4KPiBZZXMsIEkgYWdyZWUgOikKPgoKWWVhaC4uIGFuZCBJIHRoaW5rIHRob3NlIHdv
dWxkIGJlIHRvbyBtYW55IGFzIHdlIGtub3cgb2Ygc2V2ZXJhbAptb2RlbHMgd2l0aCB0aGlzIGxh
cHRvcHMgZnJvbSBMZW5vdm8sIERlbGwgYW5kIEhQIGFuZCByYW5kb20gb3RoZXIKbW9kZWxzIGZy
b20gcmFuZG9tIG90aGVyIE9FTXMuIEkgdGhpbmsgd2Ugd29uJ3QgZXZlciBiZSBhYmxlIHRvCmJs
YWNrbGlzdCBhbGwgbW9kZWxzIGlmIHdlIGdvIHRoYXQgd2F5IGFzIHRob3NlIG1pZ2h0IGJlIGp1
c3Qgd2F5IHRvbwptYW55LiBBbHNvIEkga25vdyBmcm9tIHNvbWUgcmVwb3J0cyBvbiBidW1ibGVi
ZWUgYnVncyAoaGl0dGluZyB0aGUKc2FtZSBpc3N1ZSBlc3NlbnRpYWxseSkgdGhhdCB0aGUgYWNw
aV9vc2kgb3ZlcndyaXRlIGRpZG4ndCBoZWxwIGV2ZXJ5CnVzZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
