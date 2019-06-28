Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCD5A1EF
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 19:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA696E3EB;
	Fri, 28 Jun 2019 17:08:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09AD6E3E9
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 17:08:41 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id i8so6651444oth.10
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 10:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LA7BcUYMgiPM4LhkTkot3xLWQxZ9GymJ/I3cshi8054=;
 b=gj0j5WWt8vecGPhRToWtJtGIdZvrqXm+ka/dXiZwyBOGaxKZO75S9123jhSvQ7FtI+
 0NyfVerTi/mcToM895rccqvySQ/HR+3rC40cbpHXm/VL84NLQ7sOSvNRL5SshAcqKLZh
 79ikRzu78rF85XwYxsmiaKWTOWQkxQB/qXhEYjKsAEr3NBP+bK5HqaYc6EFN/C02ufxf
 cxPUX94aWeajDbO423zAwC1RugSegvFuSt9jibopilzDzEwRydf2w/fom8Qh8pcNJ9ql
 27Ze+1TEwNEoUjWbW3p3IiVZeMWuwpRgDeT2hu1a1Mn8hGw5m3HtN1zpSBUQ6o5ihr5h
 VlmQ==
X-Gm-Message-State: APjAAAXQuDwnRkCdU1AmnpFz/osd9RooK4Z4mwzKG1Khl+NbJkEm8ZD7
 y1c5f3wRer1ME438gzWV8vb2fC54ci3tHHAv50oW3Q==
X-Google-Smtp-Source: APXvYqx9NDQoyUwfceLcBzkU2NvzJ3YM6qn8RS5E95TlC5H3OILwJGHGUQARUz+LN1VfbIDPOiU7HWfaHbo1PzKN6QA=
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr8719655oto.207.1561741721035; 
 Fri, 28 Jun 2019 10:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
In-Reply-To: <20190628170219.GA3608@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 10:08:30 -0700
Message-ID: <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LA7BcUYMgiPM4LhkTkot3xLWQxZ9GymJ/I3cshi8054=;
 b=aWEsAGzc2Yh3JREBeLfqCnbjuH6gFhlIwpqtRUdyIB6fGEGjp0c/9cteoNu7mVTPYk
 k7v3tmKRFxuMhqWzggOKwBghog33HajwgNHqZGgt7yBZssqkujvFSdmZ6oFP073o8bd1
 ZFWE8m7Q/mY3rKQ0JO12vTiImwp/mNsQn0+1FPDFmxgJqZwFVHptf+HajNjWmdXZdyi/
 sXfT7o1lOMP8oP6O1xqR5I5TKSGwy+YYZ/aXoZ4EnNCmm8t/FhivsI3LpEb/JP77AiWP
 Hl/nPelTzud50IIzNwJksYSVmktcqKvzLaRjqqynqcF7HJ5XeVfEHEzsPm9koUpO7D/j
 z+yA==
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6MDIgQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDA5OjI3OjQ0QU0g
LTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDg6
MzkgQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MTVQTSArMDIwMCwgQ2hyaXN0b3BoIEhl
bGx3aWcgd3JvdGU6Cj4gPiA+ID4gVGhlIGZ1bmN0aW9uYWxpdHkgaXMgaWRlbnRpY2FsIHRvIHRo
ZSBvbmUgY3VycmVudGx5IG9wZW4gY29kZWQgaW4KPiA+ID4gPiBkZXZpY2UtZGF4Lgo+ID4gPiA+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4g
PiA+ID4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KPiA+ID4g
PiAgZHJpdmVycy9kYXgvZGF4LXByaXZhdGUuaCB8ICA0IC0tLS0KPiA+ID4gPiAgZHJpdmVycy9k
YXgvZGV2aWNlLmMgICAgICB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4g
PiBEYW5XOiBJIHRoaW5rIHRoaXMgc2VyaWVzIGhhcyByZWFjaGVkIGVub3VnaCByZXZpZXcsIGRp
ZCB5b3Ugd2FudAo+ID4gPiB0byBhY2svdGVzdCBhbnkgZnVydGhlcj8KPiA+ID4KPiA+ID4gVGhp
cyBuZWVkcyB0byBsYW5kIGluIGhtbS5naXQgc29vbiB0byBtYWtlIHRoZSBtZXJnZSB3aW5kb3cu
Cj4gPgo+ID4gSSB3YXMgYXdhaXRpbmcgYSBkZWNpc2lvbiBhYm91dCByZXNvbHZpbmcgdGhlIGNv
bGxpc2lvbiB3aXRoIElyYSdzCj4gPiBwYXRjaCBiZWZvcmUgdGVzdGluZyB0aGUgZmluYWwgcmVz
dWx0IGFnYWluIFsxXS4gWW91IGNhbiBnbyBhaGVhZCBhbmQKPiA+IGFkZCBteSByZXZpZXdlZC1i
eSBmb3IgdGhlIHNlcmllcywgYnV0IG15IHRlc3RlZC1ieSBzaG91bGQgYmUgb24gdGhlCj4gPiBm
aW5hbCBzdGF0ZSBvZiB0aGUgc2VyaWVzLgo+Cj4gVGhlIGNvbmZsaWN0IGxvb2tzIE9LIHRvIG1l
LCBJIHRoaW5rIHdlIGNhbiBsZXQgQW5kcmV3IGFuZCBMaW51cwo+IHJlc29sdmUgaXQuCj4KCkFu
ZHJldydzIHRyZWUgZWZmZWN0aXZlbHkgYWx3YXlzIHJlYmFzZXMgc2luY2UgaXQncyBhIHF1aWx0
IHNlcmllcy4KSSdkIHJlY29tbWVuZCBwdWxsaW5nIElyYSdzIHBhdGNoIG91dCBvZiAtbW0gYW5k
IGFwcGx5aW5nIGl0IHdpdGggdGhlCnJlc3Qgb2YgaG1tIHJld29ya3MuIEFueSBvdGhlciBnaXQg
dHJlZSBJJ2QgYWdyZWUgd2l0aCBqdXN0IGRvaW5nIHRoZQpsYXRlIGNvbmZsaWN0IHJlc29sdXRp
b24sIGJ1dCBJJ20gbm90IGNsZWFyIG9uIHdoYXQncyB0aGUgYmVzdApwcmFjdGljZSB3aGVuIGNv
bmZsaWN0aW5nIHdpdGggLW1tLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXU=
