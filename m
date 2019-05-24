Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678212D46C
	for <lists+nouveau@lfdr.de>; Wed, 29 May 2019 06:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291476E06D;
	Wed, 29 May 2019 04:10:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Fri, 24 May 2019 15:20:10 UTC
Received: from c.mx.filmlight.ltd.uk (c.mx.filmlight.ltd.uk
 [IPv6:2a05:d018:e66:3130::21])
 by gabe.freedesktop.org (Postfix) with ESMTP id D94186E112;
 Fri, 24 May 2019 15:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by omni.filmlight.ltd.uk (Postfix) with ESMTP id E84FD40000D9;
 Fri, 24 May 2019 16:11:14 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 omni.filmlight.ltd.uk E84FD40000D9
Received: from montana.filmlight.ltd.uk (envoy [62.7.83.226])
 (Authenticated sender: roger)
 by omni.filmlight.ltd.uk (Postfix) with ESMTPSA id AB169887FAA;
 Fri, 24 May 2019 16:11:14 +0100 (BST)
To: Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
 <20190523112740.7167aba4@gandalf.local.home>
From: Roger Willcocks <roger@filmlight.ltd.uk>
Message-ID: <e4e875f0-2aa5-89f4-f462-78bedb9c5cde@filmlight.ltd.uk>
Date: Fri, 24 May 2019 16:11:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523112740.7167aba4@gandalf.local.home>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 29 May 2019 04:10:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=filmlight.ltd.uk; 
 s=default; t=1558710674;
 bh=0Ug3SmMBjFHqgISSjAkOrPxbVWMmS3DdLx7SQNNyROg=;
 h=Cc:Subject:To:References:From:Date:In-Reply-To:From;
 b=wpXaBT074VJO3lUY2B3AqfKB/W8kA/0eApqSZ41aOSGqNLFXeF+yci3TFm4WhVp4H
 kV37VGx9Na/NLT5TmdU7mOXvKRov8tvnBDw7t4Am86QVyAKBCTZ3DDWsVdZoEArlfE
 1m3WIQhTP2Qa/l+lxluF+WXJkuQNf4b1SOeoeu50=
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
 Andrew Morton <akpm@linux-foundation.org>, roger@filmlight.ltd.uk,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDIzLzA1LzIwMTkgMTY6MjcsIFN0ZXZlbiBSb3N0ZWR0IHdyb3RlOgo+Cj4gSSBoYXZlbid0
IHlldCB0ZXN0ZWQgdGhpcywgYnV0IHdoYXQgYWJvdXQgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxv
d2luZzoKPgo+IC4uLnBlcmhhcHMgZm9yZ2V0IGFib3V0IHRoZSBjb25zdGFudCBjaGVjaywgYW5k
IGp1c3QgZm9yY2UKPiB0aGUgcG93ZXIgb2YgdHdvIGNoZWNrOgo+Cj4gCQkJCQkJCVwKPiAJaWYg
KCEoX195ICYgKF9feSA+PiAxKSkpIHsJCQlcCj4gCQlfX3ggPSByb3VuZF91cCh4LCB5KTsJCQlc
Cj4gCX0gZWxzZSB7CQkJCQlcCgpZb3UgcHJvYmFibHkgd2FudAoKIMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICghKF9feSAmIChfX3kgLSAxKSkKCi0tCgpSb2dlcgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
