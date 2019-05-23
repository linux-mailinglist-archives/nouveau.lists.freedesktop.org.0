Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90128439
	for <lists+nouveau@lfdr.de>; Thu, 23 May 2019 18:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958966E032;
	Thu, 23 May 2019 16:51:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9F6E032
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 16:51:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m15so6093603ljg.13
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 09:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ks/LH2oyTEaijoOzEMOK4qT05od1mgbLgD6IvZvC3ac=;
 b=HhTMZRyOvwwqCBKrFg+EF5OJ1QCkSbyu6Z7UXcvM8LA0vGp8OwxZ/gGiXZbn9daNys
 yzt/o1lXJFza/8QdlX/Kh3fu44XbCcHO1IRoWqpqbN7yI+5/g1OYp8xNVBA+iNrR7Zli
 fxoeuO+1J6yJW642NK8LXCnY8vVC1N0qHvfc2wrumVIRoyST0UStTMKPtVJdXjoK8GMo
 iOsZbc0dnjQ15WuPSmBNnLYCYZOomrtfAtSPqSFf5k42hAs5O+3vGuwRdqkMA31LVq/H
 +35jFp2R+x7cgKQm8EmLq3RiMyP1CXsp05RHF2w1PT5s6EfUp6g9owLS0jOy6h/66u8i
 62Rg==
X-Gm-Message-State: APjAAAVldVxmZ1Hf4uqplWpc1vkPkDwj1QY96jqg6UhI3DHzdEniZ0S4
 uxYgb0voeri6dryaEC1t7cQnN1HlY/Y=
X-Google-Smtp-Source: APXvYqxbKbtzG7QhxitGdb+X4XuPzd9rSPJVbln/IXP0VeKvIQcCcov2Lxoe32UqZ0ZggahZAszvWA==
X-Received: by 2002:a2e:b051:: with SMTP id d17mr39485251ljl.173.1558630307896; 
 Thu, 23 May 2019 09:51:47 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id c19sm8241lfi.69.2019.05.23.09.51.46
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 09:51:46 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id m15so4300363lfh.4
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 09:51:46 -0700 (PDT)
X-Received: by 2002:a19:7d42:: with SMTP id y63mr41221787lfc.54.1558630305849; 
 Thu, 23 May 2019 09:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
 <20190523112740.7167aba4@gandalf.local.home>
In-Reply-To: <20190523112740.7167aba4@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 May 2019 09:51:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFJqTOk0mSxJGeh38ZxDksgRaMrNV8hqTngiuokyJzew@mail.gmail.com>
Message-ID: <CAHk-=whFJqTOk0mSxJGeh38ZxDksgRaMrNV8hqTngiuokyJzew@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ks/LH2oyTEaijoOzEMOK4qT05od1mgbLgD6IvZvC3ac=;
 b=UrcFcbzEFPGggz1NPXakVDUiIg5mDqTO4045eBb7udfHenM+Veb+rBZ0tlbryVNdJc
 qa5A4P3tgF5XCLb7D69n65wDt2yEO3fr0UKE7SehnvIvMriAPEG9xpGYM5u8gpQLeOdX
 1vpQBx74HKkfDoRasFV6IFoGOt3sYNk7jzZac=
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgODoyNyBBTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBn
b29kbWlzLm9yZz4gd3JvdGU6Cj4KPiBJIGhhdmVuJ3QgeWV0IHRlc3RlZCB0aGlzLCBidXQgd2hh
dCBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgoKU28gdGhhdCBhdCBsZWFzdCBo
YW5kbGVzIHRoZSBjb25zdGFudCBjYXNlIHRoYXQgdGhlIG5vcm1hbCAicm91bmR1cCgpIgpjYXNl
IGFsc28gaGFuZGxlcy4KCkF0IHRoZSBzYW1lIHRpbWUsIGluIHRoZSBjYXNlIHlvdSBhcmUgdGFs
a2luZyBhYm91dCwgSSByZWFsbHkgZG8Kc3VzcGVjdCB0aGF0IHdlIGhhdmUgYSAobm9uLWNvbnN0
YW50KSBwb3dlciBvZiB0d28sIGFuZCB0aGF0IHlvdQpzaG91bGQgaGF2ZSBqdXN0IHVzZWQgInJv
dW5kX3VwKCkiIHdoaWNoIHdvcmtzIGZpbmUgcmVnYXJkbGVzcyBvZgpzaXplLCBhbmQgaXMgYWx3
YXlzIGVmZmljaWVudC4KCk9uIGEgc2xpZ2h0IHRhbmdlbnQuLiBNYXliZSB3ZSBzaG91bGQgaGF2
ZSBzb21ldGhpbmcgbGlrZSB0aGlzOgoKI2RlZmluZSBzaXplX2ZuKHgsIHByZWZpeCwgLi4uKSAo
eyAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgdHlwZW9mKHgpIF9fcmV0OyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgIHN3aXRjaCAoc2l6ZW9mKHgpKSB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICBjYXNlIDE6IF9fcmV0ID0gcHJlZml4
IyM4KF9fVkFfQVJHU19fKTsgYnJlYWs7ICBcCiAgICAgICAgY2FzZSAyOiBfX3JldCA9IHByZWZp
eCMjMTYoX19WQV9BUkdTX18pOyBicmVhazsgXAogICAgICAgIGNhc2UgNDogX19yZXQgPSBwcmVm
aXgjIzMyKF9fVkFfQVJHU19fKTsgYnJlYWs7IFwKICAgICAgICBjYXNlIDg6IF9fcmV0ID0gcHJl
Zml4IyM2NChfX1ZBX0FSR1NfXyk7IGJyZWFrOyBcCiAgICAgICAgZGVmYXVsdDogX19yZXQgPSBw
cmVmaXgjI2JhZChfX1ZBX0FSR1NfXyk7ICAgICAgXAogICAgICAgIH0gX19yZXQ7IH0pCgojZGVm
aW5lIHR5cGVfZm4oeCwgcHJlZml4LCAuLi4pICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogICAgICAgIHR5cGVvZih4KSBfX3JldDsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAogICAgICAgIGlmICgodHlwZW9mKHgpKS0xID4gMSkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgX19yZXQgPSBzaXplX2ZuKHgs
IHByZWZpeCMjX3UsIF9fVkFfQVJHU19fKTsgICAgXAogICAgICAgIGVsc2UgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAg
X19yZXQgPSBzaXplX2ZuKHgsIHByZWZpeCMjX3MsIF9fVkFfQVJHU19fKTsgICAgXAogICAgICAg
IF9fcmV0OyB9KQoKd2hpY2ggd291bGQgYWxsb3cgdHlwZWQgaW50ZWdlciBmdW5jdGlvbnMgbGlr
ZSB0aGlzLiBTbyB5b3UgY291bGQgZG8Kc29tZXRoaW5nIGxpa2UKCiAgICAgI2RlZmluZSByb3Vu
ZF91cCh4LCB5KSBzaXplX2ZuKHgsIHJvdW5kX3VwX3NpemUsIHgsIHkpCgphbmQgdGhlbiB5b3Ug
ZGVmaW5lIGZ1bmN0aW9ucyBmb3Igcm91bmRfdXBfc2l6ZTgvMTYvMzIvNjQgKGFuZCB5b3UKaGF2
ZSB0b2kgZGVjbGFyZSAtIGJ1dCBub3QgZGVmaW5lIC0gcm91bmRfdXBfc2l6ZWJhZCgpKS4KCk9m
IGNvdXJzZSwgeW91IHByb2JhYmx5IHdhbnQgdGhlIHVzdWFsICJhdCBsZWFzdCB1c2UgJ2ludCci
IHNlbWFudGljcywKaW4gd2hpY2ggY2FzZSB0aGUgInR5cGUiIHNob3VsZCBiZSAiKHgpKzAiOgoK
ICAgICAjZGVmaW5lIHJvdW5kX3VwKHgsIHkpIHNpemVfZm4oKHgpKzAsIHJvdW5kX3VwX3NpemUs
IHgsIHkpCgogYW5kIHRoZSA4LWJpdCBhbmQgMTYtYml0IGNhc2VzIHdpbGwgbmV2ZXIgYmUgdXNl
ZC4KCldlIGhhdmUgYSBsb3Qgb2YgY2FzZXMgd2hlcmUgd2UgZW5kIHVwIHVzaW5nICJ0eXBlIG92
ZXJsb2FkaW5nIiBieQpzaXplLiBUaGUgbW9zdCBleHBsaWNpdCBjYXNlIGlzIHBlcmhhcHMgImdl
dF91c2VyKCkiIGFuZCAicHV0X3VzZXIoKSIsCmJ1dCB0aGlzIHdob2xlIHJvdW5kX3VwIHRoaW5n
IGlzIGFub3RoZXIgZXhhbXBsZS4KCk1heWJlIHdlIG5ldmVyIHJlYWxseSBjYXJlIGFib3V0ICJj
aGFyIiBhbmQgInNob3J0IiwgYW5kIGFsd2F5cyB3YW50Cmp1c3QgdGhlICJpbnQtdnMtbG9uZy12
cy1sb25nbG9uZyI/IFRoYXQgd291bGQgbWFrZSB0aGUgY2FzZXMgc2ltcGxlcgooMzIgYW5kIDY0
KS4gQW5kIG1heWJlIHdlIG5ldmVyIGNhcmUgYWJvdXQgc2lnbi4gQnV0IHdlIGNvdWxkIHRyeSB0
bwpoYXZlIHNvbWUgdW5pZmllZCBoZWxwZXIgbW9kZWwgbGlrZSB0aGUgYWJvdmUuLgoKICAgICAg
ICAgICAgICAgICAgTGludXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
