Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD3637706D
	for <lists+nouveau@lfdr.de>; Sat,  8 May 2021 09:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327776E85B;
	Sat,  8 May 2021 07:34:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF206E85B;
 Sat,  8 May 2021 07:34:27 +0000 (UTC)
Received: from pmoreau.org (unknown [88.129.173.226])
 (Authenticated sender: pierre.morrow@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 605A1B0053E;
 Sat,  8 May 2021 09:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620459265;
 bh=CoRmAemj/IAoMOFqzKxhniIqN+11bAiqsffykCtDA5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8AoDu73pLmKkDzdHapqCOTc9l2GpsNhhWg7LvSeQwEiaEfCKTiLc2DS2OvA/dUCs
 KHvWNs8pUEEB/fz1cz9YU8M96mF8JBvMe4mK4ZGcNZOCD7DfqUl1+LfRseYfPagMPB
 7IdmCnLyWLcJG6rbIhe+YSkU2onMgCudJhxn53BMgWTdXwm/JSN1lILpGM4Qlw4rAe
 iwxHaF6cSca/IwOUfyPxH+P27I4BD19siDm9zhrh/BEw0ifQcYIh/6BjggPWy7HLbx
 7TL4cvMESw4zd61rVDqO087ybwoFjoFLMjf5XD+95VS4Cn9pMlkWxRn7TZbA7rxLYf
 sWi+JvOGdN2JA==
Date: Sat, 8 May 2021 09:34:00 +0200
From: Pierre Moreau <pierre.morrow@free.fr>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20210508073400.nnmwwyoxqqiwv36w@pmoreau.org>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508034810.2374-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210508034810.2374-1-thunder.leizhen@huawei.com>
Subject: Re: [Nouveau] [PATCH 1/1] drm/nouveau: fix error return code in
 nouveau_backlight_init()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGVsbG8gWmhlbiwKClRoZXJlIHdhcyBhIHNpbWlsYXIgcGF0Y2ggc2VudCBpbiBsYXN0IG1vbnRo
LCB0aG91Z2ggd2hpY2ggZG9lcyBub3Qgc2VlbSB0bwpoYXZlIGJlZW4gbWVyZ2VkIHlldDsgc2Vl
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL25vdXZlYXUvMjAyMS1BcHJp
bC8wMzg0NTEuaHRtbC4KCldoZXRoZXIgYHJldGAgc2hvdWxkIGJlIGAtRU5PU1BDYCBvciBgLUVO
T01FTWAgaXMgaGFyZCB0byBzYXkgYXMKYG5vdXZlYXVfZ2V0X2JhY2tsaWdodF9uYW1lKClgIGNv
dWxkIGZhaWwgZHVlIHRvIGVpdGhlci4KCkkgd2lsbCBwcm9wb3NlIGFuIGFsdGVybmF0aXZlIGZp
eCB3aGljaCBtb2RpZmllcyBgbm91dmVhdV9nZXRfYmFja2xpZ2h0X25hbWUoKWAKdG8gcmV0dXJu
IGFuIGludCBzbyB0aGUgYWN0dWFsIGVycm9yIGNvZGUgY2FuIGJlIHByb3BhZ2F0ZWQgYmFjayBp
bnN0ZWFkIG9mCmd1ZXNzZWQsIGFzIHdlbGwgYXMgZml4IGFuIGlkYSBJRCBsZWFrIHdoaWNoIEkg
anVzdCBzcG90dGVkLgoKQmVzdCwKUGllcnJlCgpPbiAyMDIxLTA1LTA4IOKAlCAxMTo0OCwgWmhl
biBMZWkgd3JvdGU6Cj4gRml4IHRvIHJldHVybiBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgZnJvbSB0
aGUgZXJyb3IgaGFuZGxpbmcgY2FzZSBpbnN0ZWFkCj4gb2YgMCwgYXMgZG9uZSBlbHNld2hlcmUg
aW4gdGhpcyBmdW5jdGlvbi4KPiAKPiBGaXhlczogZGIxYTBhZTIxNDYxICgiZHJtL25vdXZlYXUv
Ymw6IEFzc2lnbiBkaWZmZXJlbnQgbmFtZXMgdG8gaW50ZXJmYWNlcyIpCj4gUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFpoZW4gTGVp
IDx0aHVuZGVyLmxlaXpoZW5AaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iYWNrbGlnaHQuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iYWNrbGlnaHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0
LmMKPiBpbmRleCA3MmYzNWEyYmFiY2IuLjA5N2NhMzQ0YTA4NiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9iYWNrbGlnaHQuYwo+IEBAIC0yNzMsNiArMjczLDcgQEAg
bm91dmVhdV9iYWNrbGlnaHRfaW5pdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAgCWlmICghbm91dmVhdV9nZXRfYmFja2xpZ2h0X25h
bWUoYmFja2xpZ2h0X25hbWUsIGJsKSkgewo+ICsJCXJldCA9IC1FTk9TUEM7Cj4gIAkJTlZfRVJS
T1IoZHJtLCAiRmFpbGVkIHRvIHJldHJpZXZlIGEgdW5pcXVlIG5hbWUgZm9yIHRoZSBiYWNrbGln
aHQgaW50ZXJmYWNlXG4iKTsKPiAgCQlnb3RvIGZhaWxfYWxsb2M7Cj4gIAl9Cj4gLS0gCj4gMi4y
NS4xCj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
