Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF88ECFA
	for <lists+nouveau@lfdr.de>; Thu, 15 Aug 2019 15:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55856E9AA;
	Thu, 15 Aug 2019 13:35:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325EB6E9AA;
 Thu, 15 Aug 2019 13:35:58 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A750A68AFE; Thu, 15 Aug 2019 15:35:54 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:35:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Corentin Labbe <clabbe.montjoie@gmail.com>, bskeggs@redhat.com,
 airlied@linux.ie, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
Message-ID: <20190815133554.GE12036@lst.de>
References: <20190814145033.GA11190@Red>
 <20190814174927.GT7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814174927.GT7444@phenom.ffwll.local>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] DMA-API: cacheline tracking ENOMEM,
 dma-debug disabled due to nouveau ?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6NDk6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwNDo1MDozM1BNICswMjAwLCBDb3JlbnRp
biBMYWJiZSB3cm90ZToKPiA+IEhlbGxvCj4gPiAKPiA+IFNpbmNlIGxvdCBvZiByZWxlYXNlIChh
dCBsZWFzdCBzaW5jZSA0LjE5KSwgSSBoaXQgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlOgo+
ID4gRE1BLUFQSTogY2FjaGVsaW5lIHRyYWNraW5nIEVOT01FTSwgZG1hLWRlYnVnIGRpc2FibGVk
Cj4gPiAKPiA+IEFmdGVyIGhpdHRpbmcgdGhhdCwgSSB0cnkgdG8gY2hlY2sgd2hvIGlzIGNyZWF0
aW5nIHNvIG1hbnkgRE1BIG1hcHBpbmcgYW5kIHNlZToKPiA+IGNhdCAvc3lzL2tlcm5lbC9kZWJ1
Zy9kbWEtYXBpL2R1bXAgfCBjdXQgLWQnICcgLWYyIHwgc29ydCB8IHVuaXEgLWMKPiA+ICAgICAg
IDYgYWhjaQo+ID4gICAgIDI1NyBlMTAwMGUKPiA+ICAgICAgIDYgZWhjaS1wY2kKPiA+ICAgIDU4
OTEgbm91dmVhdQo+ID4gICAgICAyNCB1aGNpX2hjZAo+ID4gCj4gPiBEb2VzIG5vdXZlYXUgaGF2
aW5nIHRoaXMgaGlnaCBudW1iZXIgb2YgRE1BIG1hcHBpbmcgaXMgbm9ybWFsID8KPiAKPiBZZWFo
IHNlZW1zIHBlcmZlY3RseSBmaW5lIGZvciBhIGdwdS4KClRoYXQgaXMgYSBsb3QgYW5kIGFwcGFy
ZW50bHkgb3ZlcndoZWxtIHRoZSBkbWEtZGVidWcgdHJhY2tpbmcuICBSb2JpbgpyZXdyb3RlIHRo
aXMgY29kZSBpbiBMaW51eCA0LjIxIHRvIHdvcmsgYSBsaXR0bGUgYmV0dGVyLCBzbyBJJ20gY3Vy
aW91cwp3aHkgdGhpcyBtaWdodCBoYXZlIGNoYW5nZXMgaW4gNC4xOSwgYXMgZG1hLWRlYnVnIGRp
ZCBub3QgY2hhbmdlIGF0CmFsbCB0aGVyZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1
