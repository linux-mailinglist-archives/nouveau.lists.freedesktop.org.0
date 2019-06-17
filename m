Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3223348A4C
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 19:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AF7892D3;
	Mon, 17 Jun 2019 17:37:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F717892C9
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2019 17:37:25 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r21so7199233otq.6
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2019 10:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBoBuo4G3FSgEhDC+FoktVJNloMg07m1kebASNjaow0=;
 b=jsW3sS6Ul495234zHPxq4jjqbWh+DkQvhp+LVhuLHiXqAXaTgV++ZPlFU9QACUPaYw
 Nbkp2kcFc+cnWYx8/BY2A34G7bDJTvRDv6776HyNpymrBeZgJ2a8HVvujDP/XQ5+I2ba
 U1Jivc7LZ8T+yRxhVQKuG0sHAfK44s8GYpMFBWfFhVWO3nKJNPUhu/gZH7MEk+fg2Qjn
 vdqWL7i/haYkyO1ZdajQ09AhyCK2P3kAhl/d+RHnf+aevMtX2b3ugMdPdU0KSaA/bkWk
 /wPsZDsPryr168IR96As+8zQo+egoy5lNmM1VAxhDJo/sjlhvrYBNAGi6NcHwTx571Eh
 FPjw==
X-Gm-Message-State: APjAAAVt9DgYF+aX6zj3S4sTRdfdbSitqrlE/JaD0EtJl3TTby9icsla
 IWF4ueIgUcFM5klRInedL4XT5lY2Y01ZwlPhLjXDLw==
X-Google-Smtp-Source: APXvYqy6UHQ+8+yRan8DQxrtjWFO0AeHWuMCd0MZM6YFNNcDvh4g1h/fJSpQjjAZ+ZTnayEmtlW26P14xfxTxsyl170=
X-Received: by 2002:a9d:470d:: with SMTP id a13mr25335686otf.126.1560793043776; 
 Mon, 17 Jun 2019 10:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-7-hch@lst.de>
In-Reply-To: <20190617122733.22432-7-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 10:37:12 -0700
Message-ID: <CAPcyv4hoRR6gzTSkWnwMiUtX6jCKz2NMOhCUfXTji8f2H1v+rg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gBoBuo4G3FSgEhDC+FoktVJNloMg07m1kebASNjaow0=;
 b=GEy6EGCLZL0UwYQ9PkUNByAPZFrQNOY55J4Isr3tPIqQ98XVq0fsFEiJHE9y337UnR
 z0ckb3F0Q8bUBMwOxk3FMovLMeLeRhGzCH4bMfXl//v4SZneAiWL2E3nXGQ0kfcbkMQ5
 r05Q0aOOGSCIoONjGAUc0NUdIqrqwt9uOKpttnI5/W0wpWZ0UjI/eMzHv96YMzDyw6ea
 Iw2XLIDHbY2xAKMBDynID8VFE/XZYZnxY6Kobfxb5Ee621xVhNNWauS73uuIqKg8WlP8
 DC4G2oI80ceWohUqqQoEpsB1uZSHUXQoqzfwbmLCxnomOs9Nh6gRUrBB4UmmNwcz2q++
 zoow==
Subject: Re: [Nouveau] [PATCH 06/25] mm: factor out a
 devm_request_free_mem_region helper
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNToyNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBLZWVwIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFsbG9jYXRpb24gdGhh
dCBobW1fYWRkX2RldmljZSBkb2VzIHdpdGggdGhlCj4gcmVzdCBvZiB0aGUgcmVzb3VyY2UgY29k
ZSwgYW5kIGFsbG93IGZ1dHVyZSByZXVzZSBvZiBpdCB3aXRob3V0IHRoZSBobW0KPiB3cmFwcGVy
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2
aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiBSZXZpZXdlZC1i
eTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xp
bnV4L2lvcG9ydC5oIHwgIDIgKysKPiAga2VybmVsL3Jlc291cmNlLmMgICAgICB8IDM5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBtbS9obW0uYyAgICAgICAgICAg
ICAgIHwgMzMgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9pb3BvcnQuaCBiL2luY2x1ZGUvbGludXgvaW9wb3J0LmgKPiBpbmRleCBk
YTBlYmFlYzI1ZjAuLjc2YTMzYWUzYmY2YyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2lv
cG9ydC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9pb3BvcnQuaAo+IEBAIC0yODYsNiArMjg2LDgg
QEAgc3RhdGljIGlubGluZSBib29sIHJlc291cmNlX292ZXJsYXBzKHN0cnVjdCByZXNvdXJjZSAq
cjEsIHN0cnVjdCByZXNvdXJjZSAqcjIpCj4gICAgICAgICByZXR1cm4gKHIxLT5zdGFydCA8PSBy
Mi0+ZW5kICYmIHIxLT5lbmQgPj0gcjItPnN0YXJ0KTsKPiAgfQo+Cj4gK3N0cnVjdCByZXNvdXJj
ZSAqZGV2bV9yZXF1ZXN0X2ZyZWVfbWVtX3JlZ2lvbihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKyAg
ICAgICAgICAgICAgIHN0cnVjdCByZXNvdXJjZSAqYmFzZSwgdW5zaWduZWQgbG9uZyBzaXplKTsK
ClRoaXMgYXBwZWFycyB0byBuZWVkIGEgJ3N0YXRpYyBpbmxpbmUnIGhlbHBlciBzdHViIGluIHRo
ZQpDT05GSUdfREVWSUNFX1BSSVZBVEU9biBjYXNlLCBvdGhlcndpc2UgdGhpcyBjb21waWxlIGVy
cm9yIHRyaWdnZXJzOgoKbGQ6IG1tL2htbS5vOiBpbiBmdW5jdGlvbiBgaG1tX2Rldm1lbV9hZGQn
OgovaG9tZS9kd2lsbGlhMi9naXQvbGludXgvbW0vaG1tLmM6MTQyNzogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0bwpgZGV2bV9yZXF1ZXN0X2ZyZWVfbWVtX3JlZ2lvbicKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
