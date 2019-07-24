Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D573D9A
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 22:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F306E653;
	Wed, 24 Jul 2019 20:18:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B66D6E655
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2019 20:18:35 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so2500254qto.10
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2019 13:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VWJ6DdSzX3UNH5IsBG0QIkcKoVJ3m7vBBB3d3WVZ5uE=;
 b=Qz/+NB+evT2Agl9/FN/an91Yw8+ejHINwyWFkuF7HcCWSbSYXNkdvwxcp9gJPYQtzV
 nmAvdf9ZqBDfhNxzFNGyVhFbIq5Yw1bpps65uqOJfkSHtsPEDtbQHsJkE852XihLklO5
 3KcSttXQnqbotBbHQYn/pngztJglspL5rT0VwdewMKOtYPalwXKu5saiOrLP6v352ndK
 FHPzLLY9QwsqBywqi7o30NEAUo/E4GGGvB9zd0EI+x+0xhRSZ3OyG3Z/y+sWs79nVGhJ
 BvsTh7hIooQy3ks8guei/gHxCnS4f7mwN0uPrygNRFenwdU8SOIxNY6SVH1q+UQlF6Ta
 tGXQ==
X-Gm-Message-State: APjAAAUqszfAdXh1zOMX4uoKaLFN6snjrqqJyd+hMQby3KY/asiLf3+Y
 s/6GLBk/InewxUT7m9Va/h2VUQ==
X-Google-Smtp-Source: APXvYqy6Kd2FCXwA5ViOoNdVk66YE8CWdFXTM44KqYbLUvwUjmODvbZbHeyXtq/HnU0w/t05AaFPsA==
X-Received: by 2002:ac8:7b99:: with SMTP id p25mr59513506qtu.243.1563999514197; 
 Wed, 24 Jul 2019 13:18:34 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id v1sm21152817qkj.19.2019.07.24.13.18.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 13:18:33 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqNib-0007Qc-5i; Wed, 24 Jul 2019 17:18:33 -0300
Date: Wed, 24 Jul 2019 17:18:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190724201833.GI28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
 <20190724180837.GF28493@ziepe.ca>
 <20190724185617.GE6410@dhcp22.suse.cz>
 <20190724185910.GF6410@dhcp22.suse.cz>
 <20190724192155.GG28493@ziepe.ca> <20190724194855.GA15029@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724194855.GA15029@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VWJ6DdSzX3UNH5IsBG0QIkcKoVJ3m7vBBB3d3WVZ5uE=;
 b=n3J+GAL+FB7VbB4RL6GVAirOAzlkzTHdeG1dUMoxA6P765HJ6vilINgoGfg1gmk1C2
 QeSv4gST+tMRdO9dLK69LLxfwyPsmiKfyvs3TUfCoqfmvKURPNG1u5ThxfSfZB/rAVJW
 lzianxfqFVnwvVRML7U80M5T1T+Rvr5AfzzqyvrySHXOSTaI+056H1I+ByDUtnJBhlEg
 xIezRDw+WneukJZqZHL6mhNX2cx/6DDLOuo7f4psXrJoTCceu3eN0GU9eB/Ur5nkuNRK
 9EMn6cOnl72B0kvwpSRZeH//s6PjsHVcKalg1f9Sgc0xqts4GjQ2MeeoyqGPz1aGpEOO
 krHg==
Subject: Re: [Nouveau] [PATCH] mm/hmm: replace hmm_update with
 mmu_notifier_range
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDk6NDg6NTVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDQ6MjE6NTVQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSWYgd2UgY2hhbmdlIHRoZSByZWdpc3RlciB0byBrZWVw
IHRoZSBobGlzdCBzb3J0ZWQgYnkgYWRkcmVzcyB0aGVuIHdlCj4gPiBjYW4gZG8gYSB0YXJnZXR0
ZWQgJ3VuZG8nIG9mIHBhc3Qgc3RhcnRzIHRlcm1pbmF0ZWQgYnkgYWRkcmVzcwo+ID4gbGVzcy10
aGFuIGNvbXBhcmlzb24gb2YgdGhlIGZpcnN0IGZhaWxpbmcgc3RydWN0IG1tdV9ub3RpZmllci4K
PiA+IAo+ID4gSXQgcmVsaWVzIG9uIHRoZSBmYWN0IHRoYXQgcmN1IGlzIG9ubHkgdXNlZCB0byBy
ZW1vdmUgaXRlbXMsIHRoZSBsaXN0Cj4gPiBhZGRzIGFyZSBhbGwgcHJvdGVjdGVkIGJ5IG1tIGxv
Y2tzLCBhbmQgdGhlIG51bWJlciBvZiBtbXUgbm90aWZpZXJzIGlzCj4gPiB2ZXJ5IHNtYWxsLgo+
ID4gCj4gPiBUaGlzIHNlZW1zIHdvcmthYmxlIGFuZCBkb2VzIG5vdCBuZWVkIG1vcmUgZHJpdmVy
IHJldmlldy91cGRhdGUuLi4KPiA+IAo+ID4gSG93ZXZlciwgaG1tJ3MgaW1wbGVtZW50YXRpb24g
c3RpbGwgbmVlZHMgbW9yZSBmaXhpbmcuCj4gCj4gQ2FuIHdlIHRha2Ugb25lIHN0ZXAgYmFjaywg
cGxlYXNlPyAgVGhlIG9ubHkgcmVhc29uIHdoeSBkcml2ZXJzCj4gaW1wbGVtZW50IGJvdGggLT5p
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGFuZCAtPmludmFsaWRhdGVfcmFuZ2VfZW5kIGFuZAo+IGV4
cGVjdCB0aGVtIHRvIGJlIGNhbGxlZCBwYWlyZWQgaXMgdG8ga2VlcCBzb21lIGZvcm0gb2YgY291
bnRlciBvZgo+IGFjdGl2ZSBpbnZhbGlkYXRpb24gInNlY3Rpb25zIi4gIFNvIGluc3RlYWQgb2Yg
ZG9jdG9yaW5nIGFyb3VuZAo+IHVuZG8gc2NoZW1lcyB0aGUgb25seSBzYW5lIGFuc3dlciBpcyB0
byB0YWtlIHN1Y2ggYSBjb3VudGVyIGludG8gdGhlCj4gY29yZSBWTSBjb2RlIGluc3RlYWQgb2Yg
aGF2aW5nIGVhY2ggZHJpdmVyIHN0cnVnZ2xlIHdpdGggaXQuCgpUaGlzIG1pZ2h0IHdvcmsgYXMg
YSBoeWJyaWQgc29ydCBvZiBpZGVhLCBsaWtlIHdoYXQgSE1NIHRyaWVkIHRvIGRvCndpdGggdGhl
IGNvdW50ZXIgYW5kIHZhbGlkIHRvZ2V0aGVyLgoKSWYgd2Uga2VlcCB0aGUgY291bnRlciBnbG9i
YWwgYW5kIHRoZW4gcHJvdmlkZSBhbiAnYWxsIGludmFsaWRhdGVzCmZpbmlzaGVkJyBjYWxsYmFj
ayB0aGVuIHRoZSBkcml2ZXIgY291bGQgcG90ZW50aWFsbHkgc3RpbGwgaWdub3JlCmludmFsaWRh
dGVzIHRoYXQgZG8gbm90IHRvdWNoIGl0cyByYW5nZXMgZHVyaW5nIGl0cyBwYWdlIGZhdWx0IHBh
dGguCgpJJ2QgaGF2ZSB0byBza2V0Y2ggaXQuLgoKSSBhZ3JlZSBpdCB3b3VsZCBzb2x2ZSB0aGlz
IHByb2JsZW0gYXMgd2VsbCBhbmQgYmV0dGVyIGFkdmFuY2UgdGhlCmdvYWwgdG8gbWFrZSBtbXUg
bm90aWZpZXJzIHNpbXBsZXIgdG8gdXNlLi4gCgpCdXQgSSBkaWRuJ3QgYXVkaXQgYWxsIHRoZSBp
bnZhbGlkYXRlX2VuZCB1c2VycyB0byBiZSBzdXJlIDopCgpKYXNvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
