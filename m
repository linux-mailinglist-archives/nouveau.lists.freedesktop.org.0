Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574CC454ED
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92C689320;
	Fri, 14 Jun 2019 06:43:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965E489320;
 Fri, 14 Jun 2019 06:43:42 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id D916768B02; Fri, 14 Jun 2019 08:43:13 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:43:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20190614064313.GM7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6NDM6MTVQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+IDxzaWdoPiAgeWVzIGJ1dCB0aGUgZWFybGllciBwYXRjaDoKPiAKPiBbUEFUQ0ggMDMvMjJd
IG1tOiByZW1vdmUgaG1tX2Rldm1lbV9hZGRfcmVzb3VyY2UKPiAKPiBSZW1vdmVzIHRoZSBvbmx5
IHBsYWNlIHR5cGUgaXMgc2V0IHRvIE1FTU9SWV9ERVZJQ0VfUFVCTElDLgo+IAo+IFNvIEkgdGhp
bmsgaXQgaXMgb2suICBGcmFua2x5IEkgd2FzIHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgcmVtb3Zl
IHRoZSBwdWJsaWMKPiB0eXBlIGFsdG9nZXRoZXIgYnV0IGNvbmNlcHR1YWxseSBpdCBzZWVtcyBv
ay4gIEJ1dCBJIGRvbid0IHNlZSBhbnkgdXNlcnMgb2YgaXQKPiBzby4uLiAgc2hvdWxkIHdlIGdl
dCByaWQgb2YgaXQgaW4gdGhlIGNvZGUgcmF0aGVyIHRoYW4gdHVybmluZyB0aGUgY29uZmlnIG9m
Zj8KClRoYXQgd2FzIG15IG9yaWdpbmFsIGlkZWEuICBCdXQgdGhlbiBhZ2FpbiBKZXJvbWUgc3Bl
bnQgYSBsb3Qgb2YgZWZmb3J0CnB1dHRpbmcgaG9va3MgZm9yIGl0IGFsbCBvdmVyIHRoZSBtbSBh
bmQgaXQgd291bGQgc2VlbSBhIGxpdHRsZSByb290CnRvIGp1c3QgcmlwIHRoaXMgb3V0IEFTQVAu
ICBJJ2xsIGdpdmUgaXQgc29tZSBtb3JlIHRpbWUsIGJ1dCBpdCBpdCBkb2Vzbid0CmdldCB1c2Vk
IGFmdGVyIGEgZmV3IG1vcmUga2VybmVsIHJlbGVhc2VzIHdlIHNob3VsZCBudWtlIGl0LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
