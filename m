Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF8BE5B6
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2019 21:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2015A6F559;
	Wed, 25 Sep 2019 19:32:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAFA6F564
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2019 19:32:13 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id i207so2495608ywc.9
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2019 12:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Y3TOSckvp+hB6Z7LsE8A0kv2GzhPr7GAD1mN1AzMI50=;
 b=QSPGZvwM7tiaejhrCTtnEbjlkAdEyWL45KH1Hhu0n9Q1mS0d+DuSSIFyV9fh4yaAer
 yMrbANxHcy2c3px0hkEgVyV03PGx6LURA7dpZeVVuBGH2NOr697Y2a6ZDZsEztaQqcgq
 F+O2sJWEqxFhBOcAx1aD0OKogKQ4WkxaFbef1zZZRjzgndx9gko27po/5ILmBW5ng01R
 12mcifBJqWDH6kSokan4S/vlhdqkAiT57OUMKFWjxuxi0oq22icg3VZ94nXdCQZetW+c
 Kt5mDGjC/LP4jFm/jUAbI6OTZOwcuPso57WllUnZFlcefZLnDkhYnhKcuqGvG4jKFbVj
 sYMA==
X-Gm-Message-State: APjAAAU2BLhaJ3yqJ2hXnN4ZttlddQoNHhtYIrDZ8vHlFK2I0JjE7dsU
 ElJ76tqbcj8ITU+paxZn9ojKbA==
X-Google-Smtp-Source: APXvYqyIEULWFxtN4GPZhWWBPSDO+4hsL0UrObHMV5ZObKETrz9HV4YQRUTFBUEcZdjSIwtuvvUPmA==
X-Received: by 2002:a81:704b:: with SMTP id l72mr6925535ywc.370.1569439932659; 
 Wed, 25 Sep 2019 12:32:12 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id u138sm1331528ywf.7.2019.09.25.12.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 12:32:12 -0700 (PDT)
Date: Wed, 25 Sep 2019 15:32:11 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20190925193211.GJ218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-19-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-19-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Y3TOSckvp+hB6Z7LsE8A0kv2GzhPr7GAD1mN1AzMI50=;
 b=TZpROw2tUrnCOXicxNYon+hvv+kCClgxG013aoYVP4mhRk2v//MwLA118MxX3QQ3Pw
 GUPXPZNG+FNUux41c2TLv80qKdieTIUQD97tEu/NnYq52Q1lslo/2fEYV7BOecY8q84s
 mjfw1eoqxRvIVf0B+Vg+DcElWVro432KeWSYZBYYqBjY09jyFod/nPtrXJ2Y9bRKz6VB
 23rnQq2OI6gPiN1wsIatwLThvj7XAX3IvCphHsxAcxQ9JSAXEzac5RWOwdTBWlcsVEJp
 FK1hR24W5S7kcvi9wOf8VvjRJvv000Xi2I1V+FjdqBvoIe4k56pVZcQja45lVweyUkkB
 1Thw==
Subject: Re: [Nouveau] [PATCH v2 18/27] drm/dp_mst: Remove lies in {up,
 down}_rep_recv documentation
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <hwentlan@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6NTZQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGVzZSBhcmUgbW9zdCBjZXJ0YWlubHkgYWNjZXNzZWQgZnJvbSBmYXIgbW9yZSB0aGFu
IHRoZSBtZ3Igd29yay4gSW4KPiBmYWN0LCB1cF9yZXFfcmVjdiBpcyAtb25seS0gZXZlciBhY2Nl
c3NlZCBmcm9tIG91dHNpZGUgdGhlIG1nciB3b3JrLgo+IAo+IENjOiBKdXN0b24gTGkgPGp1c3Rv
bi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBD
YzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzog
SGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCj4g
LS0tCj4gIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggfCA4ICsrLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
ZHBfbXN0X2hlbHBlci5oCj4gaW5kZXggZjI1M2VlNDNlOWQ5Li44YmEyYTAxMzI0YmIgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKPiBAQCAtNDg5LDE1ICs0ODksMTEgQEAgc3RydWN0IGRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyIHsKPiAgCWludCBjb25uX2Jhc2VfaWQ7Cj4gIAo+ICAJLyoq
Cj4gLQkgKiBAZG93bl9yZXBfcmVjdjogTWVzc2FnZSByZWNlaXZlciBzdGF0ZSBmb3IgZG93biBy
ZXBsaWVzLiBUaGlzIGFuZAo+IC0JICogQHVwX3JlcV9yZWN2IGFyZSBvbmx5IGV2ZXIgYWNjZXNz
IGZyb20gdGhlIHdvcmsgaXRlbSwgd2hpY2ggaXMKPiAtCSAqIHNlcmlhbGlzZWQuCj4gKwkgKiBA
ZG93bl9yZXBfcmVjdjogTWVzc2FnZSByZWNlaXZlciBzdGF0ZSBmb3IgZG93biByZXBsaWVzLgo+
ICAJICovCj4gIAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yeCBkb3duX3JlcF9yZWN2Owo+
ICAJLyoqCj4gLQkgKiBAdXBfcmVxX3JlY3Y6IE1lc3NhZ2UgcmVjZWl2ZXIgc3RhdGUgZm9yIHVw
IHJlcXVlc3RzLiBUaGlzIGFuZAo+IC0JICogQGRvd25fcmVwX3JlY3YgYXJlIG9ubHkgZXZlciBh
Y2Nlc3MgZnJvbSB0aGUgd29yayBpdGVtLCB3aGljaCBpcwo+IC0JICogc2VyaWFsaXNlZC4KPiAr
CSAqIEB1cF9yZXFfcmVjdjogTWVzc2FnZSByZWNlaXZlciBzdGF0ZSBmb3IgdXAgcmVxdWVzdHMu
Cj4gIAkgKi8KPiAgCXN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3J4IHVwX3JlcV9yZWN2Owo+
ICAKPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXU=
