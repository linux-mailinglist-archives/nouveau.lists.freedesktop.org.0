Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D75A4F9
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 21:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFE06E986;
	Fri, 28 Jun 2019 19:14:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5086E986
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 19:14:55 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id q20so7061722otl.0
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 12:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EPvpztsPK7520nxsbDhjXQoNlIusJTLU8rYF+ocke4=;
 b=FiUBzqh4JAL7F+GYhbTLRiQZhBK32vwRE9NMs9GCcsPVxMBAL81STAofI1b90khvsb
 yt4ubsw6hUTXl8MMCk0BXiOLsA9x+90V+JbtkfQPA06XYqBbWGMJ0n0q3tFeeqpfiyFo
 CP09jzJuafX514ObJERDy6P46T5j7GeGxj9qbPDiz4eXmfyhjjnGRmpttP7Z+vDpBTJc
 huwx8cPn2t5RqGOmsTW/jB7Gml50jRhoifn7YdyKRHoJppNb7t9KPU907tYTClcWylYB
 I3VYYKhJSvguEf+DUnKgzV+cuvOz2/hDGmheg0M23Agw6DpA+Bdmvjsi0McnEPlnxFcO
 S9oA==
X-Gm-Message-State: APjAAAUF4wnkqDY4ZtA/gIiBzYOXY0Dt7a5q3ea4RCbaddv6NHnDZCM2
 Q5XCa0gs1J1i1S2P+QU1Cd3xUkFbDq5nkzGl8tjmKA==
X-Google-Smtp-Source: APXvYqwk0yjTvQhVqTpz4jl7ioGiwvBTeiygz26S4gTf6ee6guEN0yjq3zRwNg6EKq8iXaiv+Kpq8rgpgiSlzbcUkgY=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr8541745otn.71.1561749295055; 
 Fri, 28 Jun 2019 12:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
 <20190628182922.GA15242@mellanox.com>
 <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com>
 <20190628185152.GA9117@lst.de>
 <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
 <20190628190207.GA9317@lst.de>
In-Reply-To: <20190628190207.GA9317@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 12:14:44 -0700
Message-ID: <CAPcyv4h90DAVHbZ4bgvJwpfB8wr2K28oEes6HcdQOpf02+NL=g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3EPvpztsPK7520nxsbDhjXQoNlIusJTLU8rYF+ocke4=;
 b=jX7l/aScOnNag6NN8PLCh3f8Z8jWQa8rXqdmRFTm19zC5cGsMg4bGsXFEunae/2WjS
 ovvvaTeYJH2utyMhChKwGiGq8ZBoeIIKayiImspczzJ8SDCf8XDDL3viRbXyjtD1lYaK
 kzh/gY0uzN3viGFbDD3U65We27uV73cZy9DpexfMTRSqDZy8x6zljmPhhW1gZcx2hqFe
 GQ/mPFT2QGn+yrEJgjwPpeYXNTM2MxsKsrWYit2Wtxn/cph7hWSIQxFHWHLu8ToPNVuS
 0Ys9z5mBN7oGuoBHQrTDBIA0uIvuwg0tIL5G5RHXTDvUcDFV767ifaCgmnx0wSkTm7cV
 iWpw==
Subject: Re: [Nouveau] [PATCH 16/25] device-dax: use the dev_pagemap
 internal refcount
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTI6MDIgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6NTk6MTlBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gSXQncyBhIGJ1ZyB0aGF0IHRoZSBjYWxsIHRvIHB1
dF9kZXZtYXBfbWFuYWdlZF9wYWdlKCkgd2FzIGdhdGVkIGJ5Cj4gPiBNRU1PUllfREVWSUNFX1BV
QkxJQyBpbiByZWxlYXNlX3BhZ2VzKCkuIFRoYXQgcGF0aCBpcyBhbHNvIGFwcGxpY2FibGUKPiA+
IHRvIE1FTU9SWV9ERVZJQ0VfRlNEQVggYmVjYXVzZSBpdCBuZWVkcyB0byB0cmlnZ2VyIHRoZSAt
PnBhZ2VfZnJlZSgpCj4gPiBjYWxsYmFjayB0byB3YWtlIHVwIHdhaXRfb25fdmFyKCkgdmlhIGZz
ZGF4X3BhZ2VmcmVlKCkuCj4gPgo+ID4gU28gSSBndWVzcyB5b3UgY291bGQgYXJndWUgdGhhdCB0
aGUgTUVNT1JZX0RFVklDRV9QVUJMSUMgcmVtb3ZhbCBwYXRjaAo+ID4gbGVmdCB0aGUgb3JpZ2lu
YWwgYnVnIGluIHBsYWNlLiBJbiB0aGF0IHNlbnNlIHdlJ3JlIG5vIHdvcnNlIG9mZiwgYnV0Cj4g
PiBzaW5jZSB3ZSBrbm93IGFib3V0IHRoZSBidWcsIHRoZSBmaXggYW5kIHRoZSBwYXRjaGVzIGhh
dmUgbm90IGJlZW4KPiA+IGFwcGxpZWQgeWV0LCB3aHkgbm90IGZpeCBpdCBub3c/Cj4KPiBUaGUg
Zml4IGl0IG5vdyB3b3VsZCBzaW1wbHkgYmUgdG8gYXBwbHkgSXJhIG9yaWdpbmFsIHBhdGNoIG5v
dywgYnV0Cj4gZ2l2ZW4gdGhhdCB3ZSBhcmUgYXQgLXJjNiBpcyB0aGlzIHJlYWxseSBhIGdvb2Qg
dGltZT8gIEFuZCBpZiB3ZSBkb24ndAo+IGFwcGx5IGl0IG5vdyBiYXNlZCBvbiB0aGUgcXVpbHQg
YmFzZWQgLW1tIHdvcmZsb3cgaXQganVzdCBzZWVtcyBhIGxvdAo+IGVhc2llciB0byBhcHBseSBp
dCBhZnRlciBteSBzZXJpZXMuICBVbmxlc3Mgd2Ugd2FudCB0byBpbmNsdWRlIGl0IGluCj4gdGhl
IHNlcmllcywgaW4gd2hpY2ggY2FzZSBJIGNhbiBkbyBhIHF1aWNrIHJlYmFzZSwgd2UnZCBqdXN0
IG5lZWQgdG8KPiBtYWtlIHN1cmUgQW5kcmV3IHB1bGxzIGl0IGZyb20gLW1tLgoKSSBiZWxpZXZl
IC1tbSBhdXRvIGRyb3BzIHBhdGNoZXMgd2hlbiB0aGV5IGFwcGVhciBpbiB0aGUgLW5leHQKYmFz
ZWxpbmUuIFNvIGl0IHNob3VsZCAianVzdCB3b3JrIiB0byBwdWxsIGl0IGludG8gdGhlIHNlcmll
cyBhbmQgc2VuZAppdCBhbG9uZyBmb3IgLW5leHQgaW5jbHVzaW9uLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
