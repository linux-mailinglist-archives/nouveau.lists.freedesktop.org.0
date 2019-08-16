Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E1907E0
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 20:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2053E6E97E;
	Fri, 16 Aug 2019 18:45:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA96E378
 for <nouveau@lists.freedesktop.org>; Fri, 16 Aug 2019 18:45:23 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id v12so1836751oic.12
 for <nouveau@lists.freedesktop.org>; Fri, 16 Aug 2019 11:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8m/PnUmMNG5r4K8qxwTrufqLXmjy5RNoUVedVSyDCas=;
 b=kkLEWzUDoOkoXawxS2l5yD4Pi3y5oYDaCY1VeYn9Jr/WCdcHsnq7u9CxEptr/XRVq3
 PeiX6KCMgay6RcClEXTSQ4bzMpBu+C3H5nJD8nOhfnlPo5OBCiwb7RZRGyYHP8AcYiXQ
 CZl1RZFQ5tGjAg+sJhCfKzCsdcL9Qo/3q0po7MtBKfiJf1oBaEdqwnqX0mY1aa0fD841
 aYufljaAbYwOdkSHdEmWQNvhIYeGhIE04Yyuj5EyYIeSF38qpT8I4GTYYw9BMIULOgue
 2WFuVBIVWTm/SypVC+OhaiPpRsJQuMFJipEQWMDCF5XrAalUGNPjmJG5NelfPfB0jsIc
 R4uQ==
X-Gm-Message-State: APjAAAUUq61sF6w7k8IRGuVvbotmQHuG9leP86UEwl35zuMl1eq9ExcL
 MiKg+iY0y9Tp+3XsVSAZBg9EE7CMvI6nUzTK+ehCzw==
X-Google-Smtp-Source: APXvYqxtlu0LEJa8psV6E/U/IwuYFYQU5hM+C5zSCrQVLfT7Mz2rnMfcYn79/qmwJoa+Ktloe0ld4rH3kcVpmdEdjao=
X-Received: by 2002:a05:6808:28d:: with SMTP id
 z13mr5408599oic.101.1565981122323; 
 Fri, 16 Aug 2019 11:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190814145033.GA11190@Red>
 <20190814174927.GT7444@phenom.ffwll.local>
 <20190816143146.GB30445@Red>
In-Reply-To: <20190816143146.GB30445@Red>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Aug 2019 20:45:11 +0200
Message-ID: <CAKMK7uGb0twmXUXS5GVN0mmGW-csWH524psJFfdFYuou9YXFDw@mail.gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8m/PnUmMNG5r4K8qxwTrufqLXmjy5RNoUVedVSyDCas=;
 b=li2IDh4mr+UAvox0w8zYX5tehUMkPPvP7XXDZCuFsaYSIFIidndEttxHLIPHalJnbr
 NjPHIAX42dtPi/AoVxuy5mtla/nzfy/BXFISPwcgG5eg7CKIeWppsVo+M1yV0O1Ivv6x
 ZkGpP31kNHoxf/lHiet4xJZ4Hrg989UdKskSM=
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
Cc: Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNDozMSBQTSBDb3JlbnRpbiBMYWJiZQo8Y2xhYmJlLm1v
bnRqb2llQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6NDk6
MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDE0LCAyMDE5
IGF0IDA0OjUwOjMzUE0gKzAyMDAsIENvcmVudGluIExhYmJlIHdyb3RlOgo+ID4gPiBIZWxsbwo+
ID4gPgo+ID4gPiBTaW5jZSBsb3Qgb2YgcmVsZWFzZSAoYXQgbGVhc3Qgc2luY2UgNC4xOSksIEkg
aGl0IHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZToKPiA+ID4gRE1BLUFQSTogY2FjaGVsaW5l
IHRyYWNraW5nIEVOT01FTSwgZG1hLWRlYnVnIGRpc2FibGVkCj4gPiA+Cj4gPiA+IEFmdGVyIGhp
dHRpbmcgdGhhdCwgSSB0cnkgdG8gY2hlY2sgd2hvIGlzIGNyZWF0aW5nIHNvIG1hbnkgRE1BIG1h
cHBpbmcgYW5kIHNlZToKPiA+ID4gY2F0IC9zeXMva2VybmVsL2RlYnVnL2RtYS1hcGkvZHVtcCB8
IGN1dCAtZCcgJyAtZjIgfCBzb3J0IHwgdW5pcSAtYwo+ID4gPiAgICAgICA2IGFoY2kKPiA+ID4g
ICAgIDI1NyBlMTAwMGUKPiA+ID4gICAgICAgNiBlaGNpLXBjaQo+ID4gPiAgICA1ODkxIG5vdXZl
YXUKPiA+ID4gICAgICAyNCB1aGNpX2hjZAo+ID4gPgo+ID4gPiBEb2VzIG5vdXZlYXUgaGF2aW5n
IHRoaXMgaGlnaCBudW1iZXIgb2YgRE1BIG1hcHBpbmcgaXMgbm9ybWFsID8KPiA+Cj4gPiBZZWFo
IHNlZW1zIHBlcmZlY3RseSBmaW5lIGZvciBhIGdwdS4KPgo+IE5vdGUgdGhhdCBpdCBuZXZlciBn
byBkb3duIGFuZCB3aGVuIEkgdGVybWluYXRlIG15IFggc2Vzc2lvbiwgaXQgc3RheXMgdGhlIHNh
bWUuCj4gU28gd2l0aG91dCBhbnkgInJlYWwiIEdQVSB3b3JrLCBkb2VzIGl0IGlzIHN0aWxsIG5v
cm1hbCB0byBoYXZlIHNvIG1hbnkgYWN0aXZlIG1hcHBpbmcgPwoKTWlnaHQganVzdCBiZSB0aGUg
ZG1hX2FsbG9jIGNhY2hlLiBJdCBzaG91bGQgZ28gZG93biB1bmRlciBtZW1vcnkKcHJlc3N1cmUg
SSB0aGluay4gT3RoZXJ3aXNlIG1pZ2h0IGFsc28gYmUgYSBsZWFrLgoKPiBGb3IgZXhhbXBsZSwg
d2hlbiBkb2luZyBzb21lIHRyYW5zZmVyLCB0aGUgYWhjaSBtYXBwaW5nIG51bWJlciBjaGFuZ2Vz
IGFuZCB0aGVuIGFsd2F5cyBnbyBkb3duIHRvIDYuCgpncHUgZHJpdmVycyB0ZW5kIHRvIGNhY2hl
IGV2ZXJ5dGhpbmcsIGFsbCB0aGUgdGltZSAuLi4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDgg
LSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXU=
