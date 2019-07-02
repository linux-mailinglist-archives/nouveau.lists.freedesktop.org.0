Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 675EF5D85F
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 01:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D546E0A5;
	Tue,  2 Jul 2019 23:18:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6EC6E09E
 for <nouveau@lists.freedesktop.org>; Tue,  2 Jul 2019 23:18:00 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id m202so435682oig.6
 for <nouveau@lists.freedesktop.org>; Tue, 02 Jul 2019 16:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5UwRiHjXkEAlhFHmvxN8ePNlS4fXC/47jr2WEGpIzo=;
 b=k17UMpIw4GaXCehBHusjqBMIT79y1PdSNPHlTeu01Y/0Ej0mGey9p9eGU9cQsuNsKp
 x3N/PJ8/EP5z1u0K9dw4SI36SI9JRizS6JLVEgTG41aZBl7qw/hdkiSMH1UQlTXPjSQY
 WH39EWSFnm1TAfriFbs57TRz7yv5Ey0EJ4FOkvgNSF2L2/YM61G80JPc3tiT9doxfYln
 HSUaMsMKvE+T0eLh2Sxywjnk7z1xd3vvKPoe0yB31fAOLc1p7eFUJEDdZ4JUgivgSJ0a
 45rTXu+KRJN+Jk9m5483948sxUv/L6NtjIhCuN++k4bC5FX9bvPgzkoDxK5Ls+8IdAKl
 z80Q==
X-Gm-Message-State: APjAAAW+0xvYVPu4cYP4ArKd0pbcwjmcNueeSF935wtZlOF3R/Jv4Djb
 4PI86JGSuA++ezmtfRox6uNp3FFN6U8AU9L7VPMsgg==
X-Google-Smtp-Source: APXvYqyLlYpHy9+AMc/X38t5BFMinZJQ01XTqDg0vHmjdWTN0eXoTzXdkzMkhqYvcnewmJArWXl9rZoSGD4d6S4ISik=
X-Received: by 2002:aca:ec82:: with SMTP id k124mr4183998oih.73.1562109479302; 
 Tue, 02 Jul 2019 16:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190701062020.19239-1-hch@lst.de> <20190701082517.GA22461@lst.de>
 <20190702184201.GO31718@mellanox.com>
In-Reply-To: <20190702184201.GO31718@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 2 Jul 2019 16:17:48 -0700
Message-ID: <CAPcyv4iWXJ-c7LahPD=Qt4RuDNTU7w_8HjsitDuj3cxngzb56g@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=u5UwRiHjXkEAlhFHmvxN8ePNlS4fXC/47jr2WEGpIzo=;
 b=OuN/4ptiyR+plJoUbh14HMfrLiUOlvumFP0tzROycbsFqfygYxNO3xqFi028k9qP6U
 2hsxYQ/2r3+ffTRQvqv/sCf8RYf+3AvuvLqH7ogDKbeVFyv/k7MsfBkCxG4uRyEvLytD
 3hBMhCKOWYcfttKhsfT8Y19T3NlQHBTeuu1o3bC0SKi1LDuyTUAXjHnls8TPzw595KLC
 nNTom92Iwyk5ROjrmSXSDkHChpxbNbnGWGRWyw3laBL4fIp/E7U50dYgr8AGkfNKV1ux
 j9NiIvFe4orlhguGifJ7Su4YhO973/sL8kBVtipoBIsWxN1zYFyjnK/YO/aROHHw66yH
 203w==
Subject: Re: [Nouveau] dev_pagemap related cleanups v4
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCAxMTo0MiBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMTA6MjU6MTdBTSAr
MDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBBbmQgSSd2ZSBkZW1vbnN0cmF0ZWQg
dGhhdCBJIGNhbid0IHNlbmQgcGF0Y2ggc2VyaWVzLi4gIFdoaWxlIHRoaXMKPiA+IGhhcyBhbGwg
dGhlIHJpZ2h0IHBhdGNoZXMsIGl0IGFsc28gaGFzIHRoZSBleHRyYSBwYXRjaGVzIGFscmVhZHkK
PiA+IGluIHRoZSBobW0gdHJlZSwgYW5kIGZvdXIgZXh0cmEgcGF0Y2hlcyBJIHdhbnRlZCB0byBz
ZW5kIG9uY2UKPiA+IHRoaXMgc2VyaWVzIGlzIG1lcmdlZC4gIEknbGwgZ2l2ZSB1cCBmb3Igbm93
LCBwbGVhc2UgdXNlIHRoZSBnaXQKPiA+IHVybCBmb3IgYW55dGhpbmcgc2VyaW91cywgYXMgaXQg
Y29udGFpbnMgdGhlIHJpZ2h0IHRoaW5nLgo+Cj4gT2theSwgSSBzb3J0ZWQgaXQgYWxsIG91dCBh
bmQgdGVtcG9yYXJpbHkgcHV0IGl0IGhlcmU6Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vamd1bnRo
b3JwZS9saW51eC9jb21taXRzL2htbQo+Cj4gQml0IGludm9sdmVkIGpvYjoKPiAtIFRvb2sgSXJh
J3MgdjQgcGF0Y2ggaW50byBobW0uZ2l0IGFuZCBjb25maXJtZWQgaXQgbWF0Y2hlcyB3aGF0Cj4g
ICBBbmRyZXcgaGFzIGluIGxpbnV4LW5leHQgYWZ0ZXIgYWxsIHRoZSBmaXh1cHMKPiAtIENoZWNr
ZWQgeW91ciBnaXRodWIgdjQgYW5kIHRoZSB2MyB0aGF0IGhpdCB0aGUgbWFpbGluZyBsaXN0IHdl
cmUKPiAgIHN1YnN0YW50aWFsbHkgc2ltaWxhciAoSSBuZXZlciBkaWQgZ2V0IGEgY2xlYW4gdjQp
IGFuZCBsYXJnZWx5Cj4gICB3ZW50IHdpdGggdGhlIGdpdGh1YiB2ZXJzaW9uCj4gLSBCYXNlZCBD
SCdzIHY0IHNlcmllcyBvbiAtcmM3IGFuZCBwdXQgYmFjayB0aGUgcmVtb3ZhbCBodW5rIGluIHN3
YXAuYwo+ICAgc28gaXQgY29tcGlsZXMKPiAtIE1lcmdlJ2QgQ0gncyBzZXJpZXMgdG8gaG1tLmdp
dCBhbmQgZml4ZWQgYWxsIHRoZSBjb25mbGljdHMgd2l0aCBJcmEKPiAgIGFuZCBSYWxwaCdzIHBh
dGNoZXMgKHN1Y2ggdGhhdCBzd2FwLmMgcmVtYWlucyB1bmNoYW5nZWQpCj4gLSBBZGRlZCBEYW4n
cyBhY2sncyBhbmQgdGVzdGVkLWJ5J3MKCkxvb2tzIGdvb2QuIFRlc3QgbWVyZ2UgKHdpdGggc29t
ZSBjb2xsaXNpb25zLCBzZWUgYmVsb3cpIGFsc28gcGFzc2VzCm15IHRlc3Qgc3VpdGUuCgo+Cj4g
SSB0aGluayB0aGlzIGZhaXJseSBjbG9zZWx5IGZvbGxvd3Mgd2hhdCB3YXMgcG9zdGVkIHRvIHRo
ZSBtYWlsaW5nCj4gbGlzdC4KPgo+IEFzIGl0IHdhcyBtb3JlIHRoYW4gYSBzaW1wbGUgJ2dpdCBh
bScsIEknbGwgbGV0IGl0IHNpdCBvbiBnaXRodWIgdW50aWwKPiBJIGhlYXIgT0sncyB0aGVuIEkn
bGwgbW92ZSBpdCB0byBrZXJuZWwub3JnJ3MgaG1tLmdpdCBhbmQgaXQgd2lsbCBoaXQKPiBsaW51
eC1uZXh0LiAwLWRheSBzaG91bGQgYWxzbyBydW4gb24gdGhpcyB3aG9sZSB0aGluZyBmcm9tIG15
IGdpdGh1Yi4KPgo+IFdoYXQgSSBrbm93IGlzIG91dHN0YW5kaW5nOgo+ICAtIFRoZSBjb25mbGlj
dGluZyBBUk0gcGF0Y2hlcywgSSB1bmRlcnN0YW5kIEFuZHJldyB3aWxsIGhhbmRsZSB0aGVzZQo+
ICAgIHBvc3QtbGludXgtbmV4dAo+ICAtIFRoZSBjb25mbGljdCB3aXRoIEFNRCBHUFUgaW4gLW5l
eHQsIEkgYW0gd2FpdGluZyB0byBoZWFyIGZyb20gQU1ECgpKdXN0IGEgaGVhZHMgdXAgdGhhdCB0
aGlzIGFsc28gY29sbGlkZXMgd2l0aCB0aGUgInN1Yi1zZWN0aW9uIiBwYXRjaGVzCmluIEFuZHJl
dydzIHRyZWUuIFRoZSByZXNvbHV0aW9uIGlzIHN0cmFpZ2h0Zm9yd2FyZCwgbW9zdGx5IGp1c3QK
Y29sbGlkaW5nIHVwZGF0ZXMgdG8gYXJjaF97YWRkLHJlbW92ZX1fbWVtb3J5KCkgY2FsbCBzaXRl
cyBpbgprZXJuZWwvbWVtcmVtYXAuYyBhbmQgY29sbGlzaW9ucyB3aXRoIHBnbWFwX2FsdG1hcCgp
IHVzYWdlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
