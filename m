Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0235E8F6DD
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 00:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1A6EA96;
	Thu, 15 Aug 2019 22:16:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3646EA96
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 22:16:01 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D48F020644;
 Thu, 15 Aug 2019 22:15:59 +0000 (UTC)
Date: Thu, 15 Aug 2019 17:15:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20190815221522.GH253360@google.com>
References: <20190801220117.14952-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801220117.14952-1-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565907361;
 bh=S+HnNRjzevYqF/1E7oN2K3HGRc81RDrKMX1OcXkblsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lYQLvuvDfrxb/sksuseUW5V/MAsUIo57vN82VjPUZoB43787ziWQ/gk17qDlFECb9
 /StBjikx3IpFkZaYIg9csIL0ploUtgbOl/vRod8B6rjjtzSTHzQaUp+tdM+Pv9vS+x
 qoLD9/VFRBxoJzRR1BUxN81EUSuS20ZNckCuQtvE=
Subject: Re: [Nouveau] [PATCH] PCI: Use pci_reset_bus() in
 quirk_reset_lenovo_thinkpad_50_nvgpu()
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
Cc: Aaron Plattner <aplattner@nvidia.com>, nouveau@lists.freedesktop.org,
 Maik Freudenberg <hhfeuer@gmx.de>, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDY6MDE6MTdQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBTaW5jZSBxdWlya19udmlkaWFfaGRhKCkgd2FzIGFkZGVkIHRoZXJlJ3Mgbm93IHR3byBu
dmlkaWEgZGV2aWNlCj4gZnVuY3Rpb25zIG9uIGFueSBsYXB0b3BzIHdpdGggbnZpZGlhIEdQVXM6
IHRoZSBIREEgY29udHJvbGxlciwgYW5kIHRoZQo+IEdQVSBpdHNlbGYuIFVuZm9ydHVuYXRlbHkg
dGhpcyBoYXMgdGhlIHNpZGVhZmZlY3Qgb2YgYnJlYWtpbmcKPiBxdWlya19yZXNldF9sZW5vdm9f
dGhpbmtwYWRfNTBfbnZncHUoKSBzaW5jZSBwY2lfcmVzZXRfZnVuY3Rpb24oKSB3YXMKPiB1c2lu
ZyBwY2lfcGFyZW50X2J1c19yZXNldCgpIHRvIHJlc2V0IHRoZSBHUFUncyByZXNwZWN0aXZlIFBD
SSBidXMsIGFuZAo+IHBjaV9wYXJlbnRfYnVzX3Jlc2V0KCkgZG9lcyBub3Qgd29yayBvbiBidXNz
ZXMgd2hpY2ggaGF2ZSBtb3JlIHRoZW4gYQo+IHNpbmdsZSBkZXZpY2UgZnVuY3Rpb24gcHJlc2Vu
dC4KPiAKPiBTbywgZml4IHRoaXMgYnkgc2ltcGx5IGNhbGxpbmcgcGNpX3Jlc2V0X2J1cygpIGlu
c3RlYWQgd2hpY2ggcHJvcGVybHkKPiByZXNldHMgdGhlIEdQVSBidXMgYW5kIGFsbCBkZXZpY2Ug
ZnVuY3Rpb25zIHVuZGVyIGl0LCBpbmNsdWRpbmcgYm90aCB0aGUKPiBHUFUgYW5kIHRoZSBIREEg
Y29udHJvbGxlci4KPiAKPiBGaXhlczogYjUxNmVhNTg2ZDcxICgiUENJOiBFbmFibGUgTlZJRElB
IEhEQSBjb250cm9sbGVycyIpCj4gQ2M6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRlPgo+
IENjOiBEYW5pZWwgRHJha2UgPGRyYWtlQGVuZGxlc3NtLmNvbT4KPiBDYzogQmpvcm4gSGVsZ2Fh
cyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBDYzogQWFyb24gUGxhdHRuZXIgPGFwbGF0dG5lckBu
dmlkaWEuY29tPgo+IENjOiBQZXRlciBXdSA8cGV0ZXJAbGVrZW5zdGV5bi5ubD4KPiBDYzogSWxp
YSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+IENjOiBLYXJvbCBIZXJic3QgPGtoZXJi
c3RAcmVkaGF0LmNvbT4KPiBDYzogTWFpayBGcmV1ZGVuYmVyZyA8aGhmZXVlckBnbXguZGU+Cj4g
Q2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVs
IDxseXVkZUByZWRoYXQuY29tPgoKV2UgbWVyZ2VkIGI1MTZlYTU4NmQ3MSBmb3IgdjUuMywgc28g
SSBhcHBsaWVkIHRoaXMgd2l0aCBCZW4ncyBhY2sgdG8KZm9yLWxpbnVzIGZvciB2NS4zLCB0aGFu
a3MhCgo+IC0tLQo+ICBkcml2ZXJzL3BjaS9xdWlya3MuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGNpL3F1aXJrcy5jIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPiBpbmRleCAyMDhhYWNmMzkz
MjkuLjQ0YzRhZTFhYmQwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9xdWlya3MuYwo+ICsr
KyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCj4gQEAgLTUyNTYsNyArNTI1Niw3IEBAIHN0YXRpYyB2
b2lkIHF1aXJrX3Jlc2V0X2xlbm92b190aGlua3BhZF9wNTBfbnZncHUoc3RydWN0IHBjaV9kZXYg
KnBkZXYpCj4gIAkgKi8KPiAgCWlmIChpb3JlYWQzMihtYXAgKyAweDIyNDBjKSAmIDB4Mikgewo+
ICAJCXBjaV9pbmZvKHBkZXYsIEZXX0JVRyAiR1BVIGxlZnQgaW5pdGlhbGl6ZWQgYnkgRUZJLCBy
ZXNldHRpbmdcbiIpOwo+IC0JCXJldCA9IHBjaV9yZXNldF9mdW5jdGlvbihwZGV2KTsKPiArCQly
ZXQgPSBwY2lfcmVzZXRfYnVzKHBkZXYpOwo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQlwY2lfZXJy
KHBkZXYsICJGYWlsZWQgdG8gcmVzZXQgR1BVOiAlZFxuIiwgcmV0KTsKPiAgCX0KPiAtLSAKPiAy
LjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
