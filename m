Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98710567A
	for <lists+nouveau@lfdr.de>; Thu, 21 Nov 2019 17:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D68D6F3DF;
	Thu, 21 Nov 2019 16:06:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD37F6F3DF
 for <nouveau@lists.freedesktop.org>; Thu, 21 Nov 2019 16:06:26 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-xgU7XAkiNfyCg04JQMEHpA-1; Thu, 21 Nov 2019 11:06:23 -0500
Received: by mail-qv1-f72.google.com with SMTP id b15so2607841qvw.6
 for <nouveau@lists.freedesktop.org>; Thu, 21 Nov 2019 08:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4u5SaUcnCKvjh6UsP+VC2r3Fd3UTQ4sI8vEm9p9IspQ=;
 b=MQyp3CkA/QDK22mzxaPP4HiBLkCweXVd7NQfgxjf1qCtTtAvMVoq2BZdlqM1MtBeXJ
 4TJ+JjcUx50w1AvbsVNAIITF+CRK8XUXgjiwqR02aYAqOQc9OAG09enXZqAe3uLbUPGm
 AojshcIhuixgY/HDF+luDcD72a2Nzc2YYAhfjVTLg5sJsX5AlCuSX8odRBZCNBTUwOVQ
 iIYusWvZ8cmzdTBM4FUpiOtMVO4zbYy+fXy8DdymZWUYVS20LGf/+ZUoMRrnEK8gTS1A
 gr2WFdssOrUGVdbq4qanut7BjdSJjfwrZBesVB5Tfgt2XSB7rGLpOpQyWziyGli40fw4
 wniw==
X-Gm-Message-State: APjAAAXs/gF/bRG5BoWWlt6MEos5eC6eGfpzvzfKlh3U+BetwM9Yh1Ze
 e/ko+cIE+yHufpFGBNbpf/LM5vtjIP3QARqBc8ecr5JEHn2LllqIy2i2TAz66sv/JSMxHjVkHDl
 MEpRkUiqn2ZSUzH60Itwt7Z80NM4CtWMUlN5gF7b/9w==
X-Received: by 2002:ac8:73c6:: with SMTP id v6mr9366621qtp.137.1574352381840; 
 Thu, 21 Nov 2019 08:06:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMWsnX6Oq8sVu9TbpGunjITLNboA1N6sHCOJjdw/pIhaC+MKSuuxVJFGx9BLlu7cQMJ12GJrcBaxUzBIiQcN8=
X-Received: by 2002:ac8:73c6:: with SMTP id v6mr9366479qtp.137.1574352380570; 
 Thu, 21 Nov 2019 08:06:20 -0800 (PST)
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
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
In-Reply-To: <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 21 Nov 2019 17:06:09 +0100
Message-ID: <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: xgU7XAkiNfyCg04JQMEHpA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574352385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bUmJw5NVvVVplfFLTrj0DWj0K1ssd2HaG6I0BvVfDc=;
 b=PgrWnZ03hoT73/yQcbID7L53VmlNCjA3911D0K1vt6/25THifjIRk/tmdNDmSb/WllzRTj
 lL3HBndrBWmIPDhPZWJKC1PWJG8qCU6uUm/yRcHpXzFebk2R1+H0Jksp6tFLOxbtNJdUKa
 DaozWfX/XVpX2jsk8ffdOHsd7KO07/0=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgNDo0NyBQTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTo1MyBQTSBL
YXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBO
b3YgMjEsIDIwMTkgYXQgMTI6NDYgUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA8bWlrYS53ZXN0ZXJi
ZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0
IDEyOjM0OjIyUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiA+IE9uIFRo
dSwgTm92IDIxLCAyMDE5IGF0IDEyOjI4IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA+IDxtaWth
Lndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBXZWQs
IE5vdiAyMCwgMjAxOSBhdCAxMToyOTozM1BNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToKPiA+ID4gPiA+ID4gPiBsYXN0IHdlZWsgb3Igc28gSSBmb3VuZCBzeXN0ZW1zIHdoZXJlIHRo
ZSBHUFUgd2FzIHVuZGVyIHRoZSAiUENJCj4gPiA+ID4gPiA+ID4gRXhwcmVzcyBSb290IFBvcnQi
IChuYW1lIGZyb20gbHNwY2kpIGFuZCBvbiB0aG9zZSBzeXN0ZW1zIGFsbCBvZiB0aGF0Cj4gPiA+
ID4gPiA+ID4gc2VlbXMgdG8gd29yay4gU28gSSBhbSB3b25kZXJpbmcgaWYgaXQncyBpbmRlZWQg
anVzdCB0aGUgMHgxOTAxIG9uZSwKPiA+ID4gPiA+ID4gPiB3aGljaCBhbHNvIGV4cGxhaW5zIE1p
a2FzIGNhc2UgdGhhdCBUaHVuZGVyYm9sdCBzdHVmZiB3b3JrcyBhcyBkZXZpY2VzCj4gPiA+ID4g
PiA+ID4gbmV2ZXIgZ2V0IHBvcHVsYXRlZCB1bmRlciB0aGlzIHBhcnRpY3VsYXIgYnJpZGdlIGNv
bnRyb2xsZXIsIGJ1dCB1bmRlcgo+ID4gPiA+ID4gPiA+IHRob3NlICJSb290IFBvcnQicwo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBJdCBhbHdheXMgaXMgYSBQQ0llIHBvcnQsIGJ1dCBpdHMgbG9j
YXRpb24gd2l0aGluIHRoZSBTb0MgbWF5IG1hdHRlci4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBFeGFj
dGx5LiBJbnRlbCBoYXJkd2FyZSBoYXMgUENJZSBwb3J0cyBvbiBDUFUgc2lkZSAodGhlc2UgYXJl
IGNhbGxlZAo+ID4gPiA+ID4gUEVHLCBQQ0kgRXhwcmVzcyBHcmFwaGljcywgcG9ydHMpLCBhbmQg
dGhlIFBDSCBzaWRlLiBJIHRoaW5rIHRoZSBJUCBpcwo+ID4gPiA+ID4gc3RpbGwgdGhlIHNhbWUu
Cj4gPiA+ID4gPgo+ID4KPiA+IHllYWgsIEkgbWVhbnQgdGhlIGJyaWRnZSBjb250cm9sbGVyIHdp
dGggdGhlIElEIDB4MTkwMSBpcyBvbiB0aGUgQ1BVCj4gPiBzaWRlLiBBbmQgaWYgdGhlIE52aWRp
YSBHUFUgaXMgb24gYSBwb3J0IG9uIHRoZSBQQ0ggc2lkZSBpdCBhbGwgc2VlbXMKPiA+IHRvIHdv
cmsganVzdCBmaW5lLgo+Cj4gQnV0IHRoYXQgbWF5IGludm9sdmUgZGlmZmVyZW50IEFNTCB0b28s
IG1heSBpdCBub3Q/Cj4KPiA+ID4gPiA+ID4gQWxzbyBzb21lIGN1c3RvbSBBTUwtYmFzZWQgcG93
ZXIgbWFuYWdlbWVudCBpcyBpbnZvbHZlZCBhbmQgdGhhdCBtYXkKPiA+ID4gPiA+ID4gYmUgbWFr
aW5nIHNwZWNpZmljIGFzc3VtcHRpb25zIG9uIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBTb0Mg
YW5kIHRoZQo+ID4gPiA+ID4gPiBHUFUgYXQgdGhlIHRpbWUgb2YgaXRzIGludm9jYXRpb24gd2hp
Y2ggdW5mb3J0dW5hdGVseSBhcmUgbm90IGtub3duIHRvCj4gPiA+ID4gPiA+IHVzLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRoZSBBTUwgaW52b2tlZCB0
byBwb3dlciBkb3duIHRoZSBHUFUgZnJvbQo+ID4gPiA+ID4gPiBhY3BpX3BjaV9zZXRfcG93ZXJf
c3RhdGUoKSBnZXRzIGNvbmZ1c2VkIGlmIGl0IGlzIG5vdCBpbiBQQ0kgRDAgYXQKPiA+ID4gPiA+
ID4gdGhhdCBwb2ludCwgc28gaXQgbG9va3MgbGlrZSB0aGF0IEFNTCB0cmllcyB0byBhY2Nlc3Mg
ZGV2aWNlIG1lbW9yeSBvbgo+ID4gPiA+ID4gPiB0aGUgR1BVIChiZXlvbmQgdGhlIFBDSSBjb25m
aWcgc3BhY2UpIG9yIHNpbWlsYXIgd2hpY2ggaXMgbm90Cj4gPiA+ID4gPiA+IGFjY2Vzc2libGUg
aW4gUENJIHBvd2VyIHN0YXRlcyBiZWxvdyBEMC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPciB0aGUg
UENJIGNvbmZpZyBzcGFjZSBvZiB0aGUgR1BVIHdoZW4gdGhlIHBhcmVudCByb290IHBvcnQgaXMg
aW4gRDNob3QKPiA+ID4gPiA+IChhcyBpdCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRo
ZSBHUFUgY29uZmlnIHNwYWNlIGlzIG5vdAo+ID4gPiA+ID4gYWNjZXNzaWJsZS4KPiA+ID4gPgo+
ID4gPiA+IFdoeSB3b3VsZCB0aGUgcGFyZW50IHBvcnQgYmUgaW4gRDNob3QgYXQgdGhhdCBwb2lu
dD8gIFdvdWxkbid0IHRoYXQgYmUKPiA+ID4gPiBhIHN1c3BlbmQgb3JkZXJpbmcgdmlvbGF0aW9u
Pwo+ID4gPgo+ID4gPiBOby4gV2UgcHV0IHRoZSBHUFUgaW50byBEM2hvdCBmaXJzdCwgdGhlbiB0
aGUgcm9vdCBwb3J0IGFuZCB0aGVuIHR1cm4KPiA+ID4gb2ZmIHRoZSBwb3dlciByZXNvdXJjZSAo
d2hpY2ggaXMgYXR0YWNoZWQgdG8gdGhlIHJvb3QgcG9ydCkgcmVzdWx0aW5nCj4gPiA+IHRoZSB0
b3BvbG9neSBlbnRlcmluZyBEM2NvbGQuCj4gPiA+Cj4gPgo+ID4gSWYgdGhlIGtlcm5lbCBkb2Vz
IGEgRDAgLT4gRDNob3QgLT4gRDAgY3ljbGUgdGhpcyB3b3JrcyBhcyB3ZWxsLCBidXQKPiA+IHRo
ZSBwb3dlciBzYXZpbmdzIGFyZSB3YXkgbG93ZXIsIHNvIEkga2luZCBvZiBwcmVmZXIgc2tpcHBp
bmcgRDNob3QKPiA+IGluc3RlYWQgb2YgRDNjb2xkLiBTa2lwcGluZyBEM2hvdCBkb2Vzbid0IHNl
ZW0gdG8gbWFrZSBhbnkgZGlmZmVyZW5jZQo+ID4gaW4gcG93ZXIgc2F2aW5ncyBpbiBteSB0ZXN0
aW5nLgo+Cj4gT0sKPgo+IFdoYXQgZXhhY3RseSBkaWQgeW91IGRvIHRvIHNraXAgRDNjb2xkIGlu
IHlvdXIgdGVzdGluZz8KPgoKRm9yIHRoYXQgSSBwb2tlZCBpbnRvIHRoZSBQQ0kgcmVnaXN0ZXJz
IGRpcmVjdGx5IGFuZCBza2lwcGVkIGRvaW5nIHRoZQpBQ1BJIGNhbGxzIGFuZCBzaW1wbHkgY2hl
Y2tlZCBmb3IgdGhlIGlkbGUgcG93ZXIgY29uc3VtcHRpb24gb24gbXkKbGFwdG9wLiBCdXQgSSBn
dWVzcyBJIHNob3VsZCByZXRlc3Qgd2l0aCBjYWxsaW5nIHBjaV9kM2NvbGRfZGlzYWJsZQpmcm9t
IG5vdXZlYXUgaW5zdGVhZD8gT3IgaXMgdGhlcmUgYSBkaWZmZXJlbnQgcHJlZmVyYWJsZSB3YXkg
b2YKdGVzdGluZyB0aGlzPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
