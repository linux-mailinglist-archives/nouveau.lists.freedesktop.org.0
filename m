Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431422809E
	for <lists+nouveau@lfdr.de>; Thu, 23 May 2019 17:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1C889F3B;
	Thu, 23 May 2019 15:11:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5436189F2E
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 15:11:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a10so5827669ljf.6
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 08:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+XRLAU6oU5E0/8gW3lY2rtdeODZlzcPWAFZA13HWTCU=;
 b=Z3ZjqVOI/JN4+iUiPh7cSPIsJM5ppz7K+Yz7LBvF/6jRkzesNdz/bB0n7E2MHfNZ+N
 WL1I7Pyuj1E/M7f6e8/G0ZDraaj5KyBE0qTa+BKmfk0cm0qo2a2QoORVRZskgYLdo7a0
 I/C/IdEvghm9YWOVgoVL+2LsghofrXjZFz5DuIt0GcwdTW1wAhxOfVR6zI6TNlyURbfR
 CiUx74Q6v2kEitYw+lqITK4Dn0tMEow/n0DXJMyyGxQVj26tkNcULXeQl8ZlYFvLQMEs
 PUcRrel96ePNPM4mvJLGNssg7nGeepG1yWssV6Msz1YTLs1JSwJPd+dgL9rqZmpF6naX
 /GqA==
X-Gm-Message-State: APjAAAX6oN0QhIpS7/0C0QKKuNy6MTH1ED3lXh2rQrxx8AWMSIshkCdw
 e7ptKZj8aJV1J/XVBhXAhwj1jnrmPW4=
X-Google-Smtp-Source: APXvYqyIbP2IIjDDbyXcgehg/qzNb421gda6ooJFWeKU/7Af1jd+rNrbzUuzfQ98p7SGXgwHtNtgzg==
X-Received: by 2002:a2e:7411:: with SMTP id p17mr1962422ljc.24.1558624261524; 
 Thu, 23 May 2019 08:11:01 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id p87sm5967388ljp.82.2019.05.23.08.11.00
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 08:11:00 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id q62so5820032ljq.7
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 08:11:00 -0700 (PDT)
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr18999482lji.189.1558624260065; 
 Thu, 23 May 2019 08:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190523100013.52a8d2a6@gandalf.local.home>
In-Reply-To: <20190523100013.52a8d2a6@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 May 2019 08:10:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
Message-ID: <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+XRLAU6oU5E0/8gW3lY2rtdeODZlzcPWAFZA13HWTCU=;
 b=A87Rf4qG4wn9ePdBXWK4S6A+i4fN/l2BHBriTyA/NV7md909J0ajFqoql7nafgIWFX
 zNeMu8SMtxpeDziW/96Gcai5LoSeFlFor/iwm8XXRysAwkMkqUmZRyYrQAC88L1pZlXU
 ZQKZDUd8/qaGGjTkJPmRfmYpeswXlH3T1V2Y0=
Subject: Re: [Nouveau] [RFC][PATCH] kernel.h: Add generic roundup_64() macro
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNzowMCBBTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBn
b29kbWlzLm9yZz4gd3JvdGU6Cj4KPiArIyBkZWZpbmUgcm91bmR1cF82NCh4LCB5KSAoICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAreyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIHR5cGVvZih5KSBfX3kgPSB5OyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIHR5cGVvZih4KSBfX3ggPSAo
eCkgKyAoX195IC0gMSk7ICAgICAgICAgICAgICAgIFwKPiArICAgICAgIGRvX2RpdihfX3gsIF9f
eSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIF9feCAqIF9feTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArfSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKClRoZSB0aGluZyBhYm91
dCB0aGlzIGlzIHRoYXQgaXQgYWJzb2x1dGVseSBzdWNrcyBmb3IgcG93ZXItb2YtdHdvIGFyZ3Vt
ZW50cy4KClRoZSByZWd1bGFyIHJvdW5kdXAoKSB0aGF0IHVzZXMgZGl2aXNpb24gaGFzIHRoZSBj
b21waWxlciBhdCBsZWFzdApvcHRpbWl6ZSB0aGVtIHRvIHNoaWZ0cyAtIGF0IGxlYXN0IGZvciBj
b25zdGFudCBjYXNlcy4gQnV0IGRvX2RpdigpIGlzCm1lYW50IGZvciAid2UgYWxyZWFkeSBrbm93
IGl0J3Mgbm90IGEgcG93ZXIgb2YgdHdvIiwgYW5kIHRoZSBjb21waWxlcgpkb2Vzbid0IGhhdmUg
YW55IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGludGVybmFscy4KCkFuZCBpdCBsb29rcyB0byBtZSBs
aWtlIHRoZSB1c2UgY2FzZSB5b3Ugd2FudCB0aGlzIGZvciBpcyB2ZXJ5IG11Y2gKcHJvYmFibHkg
YSBwb3dlciBvZiB0d28uIEluIHdoaWNoIGNhc2UgZGl2aXNpb24gaXMgYWxsIGtpbmRzIG9mIGp1
c3QKc3R1cGlkLgoKQW5kIHdlIGFscmVhZHkgaGF2ZSBhIHBvd2VyLW9mLXR3byByb3VuZCB1cCBm
dW5jdGlvbiB0aGF0IHdvcmtzIG9uCnU2NC4gSXQncyBjYWxsZWQgInJvdW5kX3VwKCkiLgoKSSB3
aXNoIHdlIGhhZCBhIGJldHRlciB2aXN1YWwgd2FybmluZyBhYm91dCB0aGUgZGlmZmVyZW5jZXMg
YmV0d2Vlbgoicm91bmRfdXAoKSIgKGxpbWl0ZWQgdG8gcG93ZXJzLW9mLXR3bywgYnV0IGVmZmlj
aWVudCwgYW5kIHdvcmtzIHdpdGgKYW55IHNpemUpIGFuZCAicm91bmR1cCgpIiAoZ2VuZXJpYywg
cG90ZW50aWFsbHkgaG9ycmlibHkgc2xvdywgYW5kCmRvZXNuJ3Qgd29yayBmb3IgNjQtYml0IG9u
IDMyLWJpdCkuCgpTaWRlIG5vdGU6ICJyb3VuZF91cCgpIiBoYXMgdGhlIHByb2JsZW0gdGhhdCBp
dCB1c2VzICJ4IiB0d2ljZS4KCkVuZCByZXN1bHQ6IHNvbWVib2R5IHNob3VsZCBsb29rIGF0IHRo
aXMsIGJ1dCBJIHJlYWxseSBkb24ndCBsaWtlIHRoZQoiZm9yY2UgZGl2aXNpb24iIGNhc2UgdGhh
dCBpcyBsaWtlbHkgaG9ycmlibHkgc2xvdyBhbmQgbmFzdHkuCgogICAgICAgICAgICAgICAgICBM
aW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
