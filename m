Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC728C43
	for <lists+nouveau@lfdr.de>; Thu, 23 May 2019 23:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5646E07F;
	Thu, 23 May 2019 21:19:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163536E07D
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 21:19:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j24so6829534ljg.1
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 14:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDS3Ns71UvqAxo/Ziy/UlngEZ1rvpeIhNyX6PGvAAp8=;
 b=MZPgtMXEB2sCdIjzsj9zq5lhF/bGxSx/S+3XRUmA5kosVHbwUrP+G5nrSqoD0wTsNi
 PH1VIDbtSOdh7kOYz5iyl79gYPqALzw3es6zGjb6DnXC/0VVKEcXg7yLen3ziRD4KwN6
 3VKs1JHZHGVbf6iS7lw7sPLjezLfTW+WC8U1cMNH/jwbKHvyKoh+ICg6P8DMqVsVbcaA
 swwGBVbP2MVHNgbuL7VgHRuNnuvHkiqavOeSG11cG+XK072ugIUR6XKZSVwIQi6+1faa
 AbVlKYLIpy+bESaFNqwGKFi9cSA5+XAEQpqtNF6iKY9ELugW6fJbPys0PRbOYmrVOnrN
 jp1w==
X-Gm-Message-State: APjAAAUsFrUWT1PEjNAENjDTNGDXpsVzmnGFMZtvcRu4W4PQDfh0lMVd
 LnnoLTJtMMW7lIPYeSIr1D5UL6giWI0=
X-Google-Smtp-Source: APXvYqwmlsb96VLgN7riFM6sdapua4sfESeekGSKD5uZsmrqkz63n5daZ14FJf4dwPBvUkxIPtvJgw==
X-Received: by 2002:a2e:890c:: with SMTP id d12mr44987168lji.107.1558646382854; 
 Thu, 23 May 2019 14:19:42 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id g14sm143636lfb.20.2019.05.23.14.19.41
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 14:19:41 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id z5so6795002lji.10
 for <nouveau@lists.freedesktop.org>; Thu, 23 May 2019 14:19:41 -0700 (PDT)
X-Received: by 2002:a2e:9f41:: with SMTP id v1mr12462152ljk.66.1558646380884; 
 Thu, 23 May 2019 14:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
 <20190523112740.7167aba4@gandalf.local.home>
 <CAHk-=whFJqTOk0mSxJGeh38ZxDksgRaMrNV8hqTngiuokyJzew@mail.gmail.com>
 <20190523133648.591f9e78@gandalf.local.home>
In-Reply-To: <20190523133648.591f9e78@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 May 2019 14:19:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whATjcpjVmTtM-MJw=XWY9kxq2xc67wA4_UkmVgF1mf2Q@mail.gmail.com>
Message-ID: <CAHk-=whATjcpjVmTtM-MJw=XWY9kxq2xc67wA4_UkmVgF1mf2Q@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zDS3Ns71UvqAxo/Ziy/UlngEZ1rvpeIhNyX6PGvAAp8=;
 b=H4gjzqmptwunXRqYKn250eOT7ZJCydxukVmu4abj4LD8/gbMEVOPhuM7deCH1oNhln
 IhAnoulFRb3ISTB2HVOGL4lwyjS9ysrUvrNhplgIj/dCVrMGGG7bNKPjDw5bsLNtt6oh
 ZXbn+4T7bsuWw2xhN1jJiH7ToSUE6NWp3vTNg=
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTA6MzYgQU0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRA
Z29vZG1pcy5vcmc+IHdyb3RlOgo+Cj4gPgo+ID4gT2YgY291cnNlLCB5b3UgcHJvYmFibHkgd2Fu
dCB0aGUgdXN1YWwgImF0IGxlYXN0IHVzZSAnaW50JyIgc2VtYW50aWNzLAo+ID4gaW4gd2hpY2gg
Y2FzZSB0aGUgInR5cGUiIHNob3VsZCBiZSAiKHgpKzAiOgo+ID4KPiA+ICAgICAgI2RlZmluZSBy
b3VuZF91cCh4LCB5KSBzaXplX2ZuKCh4KSswLCByb3VuZF91cF9zaXplLCB4LCB5KQo+ID4KPiA+
ICBhbmQgdGhlIDgtYml0IGFuZCAxNi1iaXQgY2FzZXMgd2lsbCBuZXZlciBiZSB1c2VkLgo+Cj4g
SSdtIGN1cmlvdXMgdG8gd2hhdCB0aGUgYWR2YW50YWdlIG9mIHRoYXQgaXM/CgpMZXQncyBzYXkg
dGhhdCB5b3UgaGF2ZSBhIHN0cnVjdHVyZSB3aXRoIGEgJ3Vuc2lnbmVkIGNoYXInIG1lbWJlciwK
YmVjYXVzZSB0aGUgdmFsdWUgcmFuZ2UgaXMgMC0yNTUuCgpXaGF0IGhhcHBlbnMgaWYgeW91IGRv
CgogICB4ID0gcm91bmRfdXAocC0+bWVtYmVyLCA0KTsKCmFuZCB0aGUgdmFsdWUgaXMgMjU1PwoK
Tm93LCBpZiB5b3Ugc3RheSBpbiAndW5zaWduZWQgY2hhcicgdGhlIGVuZCByZXN1bHQgaXMgMC4g
SWYgeW91IGZvbGxvdwp0aGUgdXN1YWwgQyBpbnRlZ2VyIHByb21vdGlvbiBydWxlcyAoImFsbCBh
cml0aG1ldGljIHByb21vdGVzIHRvIGF0CmxlYXN0ICdpbnQnIiksIHlvdSBnZXQgMjU2LgoKTW9z
dCBwZW9wbGUgcHJvYmFibHkgZXhwZWN0IDI1NiwgYW5kIHRoYXQgaW1wbGllcyB0aGF0IGV2ZW4g
aWYgeW91CnBhc3MgYW4gJ3Vuc2lnbmVkIGNoYXInIHRvIGFuIGFyaXRobWV0aWMgZnVuY3Rpb24g
bGlrZSB0aGlzLCB5b3UKZXhwZWN0IGFueSBtYXRoIHRvIGJlIGRvbmUgaW4gJ2ludCcuIERvaW5n
IHRoZSAiKHgpKzAiIGZvcmNlcyB0aGF0LApiZWNhdXNlIHRoZSAiKzAiIGNoYW5nZXMgdGhlIHR5
cGUgb2YgdGhlIGV4cHJlc3Npb24gZnJvbSAidW5zaWduZWQKY2hhciIgdG8gImludCIgZHVlIHRv
IEMgaW50ZWdlciBwcm9tb3Rpb24uCgpZZXMuIFRoZSBDIGludGVnZXIgdHlwZSBydWxlcyBhcmUg
c3VidGxlIGFuZCBzb21ldGltZXMgc3VycHJpc2luZy4gT25lCm9mIHRoZSB0aGluZ3MgSSd2ZSB3
YW50ZWQgaXMgdG8gaGF2ZSBzb21lIHdheSB0byBsaW1pdCBzaWxlbnQKcHJvbW90aW9uIChhbmQg
c2lsZW50IHRydW5jYXRpb24hKSwgYW5kIGNhdXNlIHdhcm5pbmdzLiAnc3BhcnNlJyBkb2VzCnNv
bWUgb2YgdGhhdCB3aXRoIHNvbWUgc3BlY2lhbC1jYXNlIHR5cGVzIChpZSBfX2JpdHdpc2UpLCBi
dXQgaXQncwpwcmV0dHkgbGltaXRlZC4KCiAgICAgICAgICAgICAgTGludXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
