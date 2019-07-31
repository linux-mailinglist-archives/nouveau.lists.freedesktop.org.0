Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F97D00C
	for <lists+nouveau@lfdr.de>; Wed, 31 Jul 2019 23:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9536E2FD;
	Wed, 31 Jul 2019 21:28:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 580 seconds by postgrey-1.36 at gabe;
 Wed, 31 Jul 2019 21:28:25 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02026E2FD
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2019 21:28:25 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 5E1F53000467F;
 Wed, 31 Jul 2019 23:18:42 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 282E722B035; Wed, 31 Jul 2019 23:18:42 +0200 (CEST)
Date: Wed, 31 Jul 2019 23:18:42 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20190731211842.befvpoyudrm2subf@wunner.de>
References: <20190731201927.22054-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731201927.22054-1-lyude@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [Nouveau] [PATCH] Revert "PCI: Enable NVIDIA HDA controllers"
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
 Daniel Drake <drake@endlessm.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDQ6MTk6MjdQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBXaGlsZSB0aGlzIGZpeGVzIGF1ZGlvIGZvciBhIG51bWJlciBvZiB1c2VycywgdGhpcyBj
b21taXQgaGFzIHRoZQo+IHNpZGVhZmZlY3Qgb2YgYnJlYWtpbmcgdGhlIEJJT1Mgd29ya2Fyb3Vu
ZCB0aGF0J3MgcmVxdWlyZWQgdG8gbWFrZSB0aGUKPiBHUFUgb24gdGhlIG52aWRpYSBQNTAgd29y
aywgYnkgY2F1c2luZyB0aGUgR1BVJ3MgUENJIGRldmljZSBmdW5jdGlvbiB0bwo+IHN0b3Agd29y
a2luZyBhZnRlciBpdCdzIGJlZW4gc2V0IHRvIG11bHRpZnVuY3Rpb24gbW9kZS4KClRoaXMgaXMg
bWlzc2luZyBhIHJlZmVyZW5jZSB0byB0aGUgY29tbWl0IGludHJvZHVjaW5nIHRoZSBQNTAgcXVp
cmssCndoaWNoIGlzIGUwNTQ3YzgxYmZjZiAoIlBDSTogUmVzZXQgTGVub3ZvIFRoaW5rUGFkIFA1
MCBudmdwdSBhdCBib290CmlmIG5lY2Vzc2FyeSIpLgoKUGxlYXNlIGRlc2NyaWJlIGluIG1vcmUg
ZGV0YWlsIGhvdyB0aGUgR1BVJ3MgUENJIGZ1bmN0aW9uIHN0b3BzIHdvcmtpbmcuCkRvZXMgaXQg
cmVzcG9uZCB3aXRoICJhbGwgb25lcyIgd2hlbiBhY2Nlc3NpbmcgTU1JTz8KRG8gTU1JTyBhY2Nl
c3NlcyBjYXVzZSB0aGUgc3lzdGVtIHRvIGhhbmc/CgpDb3VsZCB5b3UgcHJvdmlkZSBsc3BjaSAt
dnZ4eCBvdXRwdXQgZm9yIHRoZSBHUFUgYW5kIGl0cyBhc3NvY2lhdGVkCkhEQSBjb250cm9sbGVy
IHdpdGggYW5kIHdpdGhvdXQgYjUxNmVhNTg2ZDcxPwoKRG9lcyB0aGlzIG1hY2hpbmUgaGF2ZSBl
eHRlcm5hbCBkaXNwbGF5IGNvbm5lY3RvcnMgdmlhIHdoaWNoIGF1ZGlvCmNhbiBiZSBzdHJlYW1l
ZD8KCgo+IEknbSBub3QgcmVhbGx5IGhvbGRpbmcgbXkgYnJlYXRoIG9uIHRoaXMgcGF0Y2ggdG8g
YmVpbmcgYWNjZXB0ZWQ6Cj4gdGhlcmUncyBhIGdvb2QgY2hhbmNlIHRoZXJlJ3MgYSBiZXR0ZXIg
c29sdXRpb24gZm9yIHRoaXMgKGFuZCBJJ20gZ29pbmcKPiB0byBjb250aW51ZSBpbnZlc3RpZ2F0
aW5nIGZvciBvbmUgYWZ0ZXIgc2VuZGluZyB0aGlzIHBhdGNoKSwgdGhpcyBpcwo+IG1vcmUganVz
dCB0byBzdGFydCBhIGNvbnZlcnNhdGlvbiBvbiB3aGF0IHRoZSBwcm9wZXIgd2F5IHRvIGZpeCB0
aGlzIGlzLgoKUG9zdGluZyBhcyBhbiBSRkMgbWlnaHQgaGF2ZSBiZWVuIG1vcmUgYXBwcm9wcmlh
dGUgdGhlbi4KCgo+IFNvLCBJJ20ga2luZCBvZiBjb25mdXNlZCBhYm91dCB3aHkgZXhhY3RseSB0
aGlzIHdhcyBpbXBsZW1lbnRlZCBhcyBhbgo+IGVhcmx5IGJvb3QgcXVpcmsgaW4gdGhlIGZpcnN0
IHBsYWNlLiBJZiB3ZSdyZSBzZWVpbmcgdGhlIEdQVSdzIFBDSQo+IGRldmljZSwgd2UgYWxyZWFk
eSBrbm93IHRoZSBHUFUgaXMgdGhlcmUuIFNob3VsZG4ndCB3ZSBiZSBhYmxlIHRvIGNoZWNrCj4g
Zm9yIHRoZSBleGlzdGVuY2Ugb2YgdGhlIEhEQSBkZXZpY2Ugb25jZSB3ZSBwcm9iZSB0aGUgR1BV
IGluIG5vdXZlYXU/CgpJIHRoaW5rIGEgbW90aXZhdGlvbiB0byBrZWVwIHRoaXMgZ2VuZXJpYyB3
YXMgdG8gbWFrZSBpdCB3b3JrIHdpdGgKb3RoZXIgZHJpdmVycyBiZXNpZGVzIG5vdXZlYXUsIHNw
ZWNpZmljYWxseSBOdmlkaWEncyBwcm9wcmlldGFyeSBkcml2ZXIuCm5vdXZlYXUgbWlnaHQgbm90
IGV2ZW4gYmUgZW5hYmxlZC4KCgo+IHRoYXQgc3RpbGwgZG9lc24ndCBleHBsYWluIHdoeSB0aGlz
IHdhcyBpbXBsZW1lbnRlZCBhcyBhbiBlYXJseSBxdWlyawoKVGhpcyBpc24ndCBhbiBlYXJseSBx
dWlyay4gIFRob3NlIGxpdmUgaW4gYXJjaC94ODYva2VybmVsL2Vhcmx5LXF1aXJrcy5jLgpUaGlz
IGlzIGp1c3QgYSBQQ0kgcXVpcmsgZXhlY3V0ZWQgb24gZGV2aWNlIGVudW1lcmF0aW9uIGFuZCBv
biByZXN1bWUuCkRldmljZXMgYXJlbid0IG5lY2Vzc2FyaWx5IGVudW1lcmF0ZWQgb25seSBvbiBi
b290LCBlLmcuIHRoaW5rIFRodW5kZXJib2x0LgoKVGhhbmtzLAoKTHVrYXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
