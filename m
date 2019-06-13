Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33344C2E
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 21:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788B8896BF;
	Thu, 13 Jun 2019 19:34:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 508 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2019 19:34:17 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f64:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D49896BF
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 19:34:17 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 1F0D93000094A;
 Thu, 13 Jun 2019 21:25:45 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id E17A94CF7F; Thu, 13 Jun 2019 21:25:44 +0200 (CEST)
Date: Thu, 13 Jun 2019 21:25:44 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20190613192544.jpz35sjtmnw25gox@wunner.de>
References: <20190613063514.15317-1-drake@endlessm.com>
 <CAKb7UvjAGtQrcgO=GE8JHuy=mgCtOr+eTinBVwekXGHiam1t1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvjAGtQrcgO=GE8JHuy=mgCtOr+eTinBVwekXGHiam1t1A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [Nouveau] [PATCH] PCI: Expose hidden NVIDIA HDA controllers
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
Cc: Aaron Plattner <aplattner@nvidia.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Maik Freudenberg <hhfeuer@gmx.de>,
 Daniel Drake <drake@endlessm.com>, nouveau <nouveau@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux@endlessm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6MTU6MzFBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMjozNSBBTSBEYW5pZWwgRHJha2UgPGRyYWtl
QGVuZGxlc3NtLmNvbT4gd3JvdGU6Cj4gPiBMaW5rOiBodHRwczovL2RldnRhbGsubnZpZGlhLmNv
bS9kZWZhdWx0L3RvcGljLzEwMjQwMjIKPiA+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRl
c2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD03NTk4NQo+ID4gQ2M6IEFhcm9uIFBsYXR0bmVyIDxh
cGxhdHRuZXJAbnZpZGlhLmNvbT4KPiA+IENjOiBQZXRlciBXdSA8cGV0ZXJAbGVrZW5zdGV5bi5u
bD4KPiA+IENjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Cj4gPiBDYzogS2Fy
b2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gPiBDYzogTWFpayBGcmV1ZGVuYmVyZyA8
aGhmZXVlckBnbXguZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1
bm5lci5kZT4KPiA+IFRlc3RlZC1ieTogRGFuaWVsIERyYWtlIDxkcmFrZUBlbmRsZXNzbS5jb20+
CgpEYW5pZWwsIGlmIHlvdSBzdWJtaXQgYSB2MiB0byBhZGRyZXNzIElsaWEncyBjb21tZW50cywg
cGxlYXNlIGJlIHN1cmUKdG8gYWRkIHlvdXIgU2lnbmVkLW9mZi1ieS4gIFRoYW5rcyBmb3IgdGFr
aW5nIGNhcmUgb2YgbWFpbmxpbmluZyB0aGlzLgoKS2luZCByZWdhcmRzLAoKTHVrYXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5n
IGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
