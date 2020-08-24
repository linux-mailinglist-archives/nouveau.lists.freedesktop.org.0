Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D324F319
	for <lists+nouveau@lfdr.de>; Mon, 24 Aug 2020 09:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE816E1B6;
	Mon, 24 Aug 2020 07:26:58 +0000 (UTC)
X-Original-To: Nouveau@lists.freedesktop.org
Delivered-To: Nouveau@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC596E1B6;
 Mon, 24 Aug 2020 07:26:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i26so7118292edv.4;
 Mon, 24 Aug 2020 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S5WjlH/KnJcA5Jy9W/SU+iQ58+NbQEMAhzncNJBoNb4=;
 b=ZnTn60XlIFTsRKgFA8pFfB0PsSgwG62us2AG6Hmm2w+OM88QvYGX0dFp9IJArtC/5V
 va6QXj3JaEhN3VQAnMMXIpXPESU1I3pPD0smQr7Q6eP5z7FBzqY0mv9OdOvqiLGzAX8n
 B5xydnnWQJAJSX6QJYrU9EpQUb2qZbC20xnStsP2HzNyTN1s7XNhzmRtdEzt8IBHfC/8
 8P1I9sSm//wmH6lZWQBh+dgzjkZw+bDeSO5oOQXLE4t6jRbgC0IIsVgp7mhhI5boW9cu
 uSiGNy7Ijm6ev0q2ghbppthD9GQw29Cdp1Oz4IaW2meCQYRf9EMZsZC5u3eyU/V1h6ZC
 fDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S5WjlH/KnJcA5Jy9W/SU+iQ58+NbQEMAhzncNJBoNb4=;
 b=rVuUa/c3mOJ3Bx5TArc442zUtY6w8KgvG+Bv4yceSgOrmSdtRco1+tZVCXq9ulTEhJ
 s8NBvX8MVGqy4dQOl4R0PxePZ1DwFtOyKbvEV+T80UYAMhPv7MH23NxkBIDzld9yMAwo
 nU+SrybXyh5U6bjgQk2qbFy8atODvlYZkAI0kw0D2doj3No9biK4LGF/Jy23Y/aGDt2A
 rDhEIGzZVd7V4+1Uc1FLiaTWTwRsfMyFKGzbbHhsSiM9uoMwVSLhzujgbbpxMsF2n872
 6vt9ELhaO2syFIFJ32/HmKYCxlSvS7cp6g2iBjtQLscK5PsBDpgJwxrscYqqiLBRxYQu
 QnGA==
X-Gm-Message-State: AOAM533YmW40cjH49d45L+yow4fL+2Vd9VQI5WkyUqnsSWGBnLX5IlVG
 ua578KDq92FtliVYjWXMXZ+WSjMPLk46w9mw0LY=
X-Google-Smtp-Source: ABdhPJy9+Upbte7WZd9uztjmGFW6JqsAjgMlkst/F8+pF9nbMY12Ue7AcrWX/05BTZJfa/XK4Ctue/sdpehN+Dy5vxo=
X-Received: by 2002:aa7:d293:: with SMTP id w19mr4042124edq.119.1598254015191; 
 Mon, 24 Aug 2020 00:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200821160050.1368-1-christian.koenig@amd.com>
In-Reply-To: <20200821160050.1368-1-christian.koenig@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 Aug 2020 17:26:43 +1000
Message-ID: <CAPM=9tyip4mbTT_rjz115xGtMCLr4LTu2pu2G4n99mpx4VHWgQ@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Nouveau] Moving LRU handling into Nouveau v3
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
Cc: nouveau <Nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SSd2ZSBhbHNvIGdpdmVuIHRoaXMgYSBzcGluIGhlcmUsIHNlZW1zIHRvIGJlIG9rYXkuCgpJJ3Zl
IHJlYWQgdGhlIHBhdGNoZXMgYW5kIHRoZXkgYWxsIHNlZW0gZmluZS4KUmV2aWV3ZWQtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CmZvciBhbGwgMyBwYXRjaGVzLgoKRGF2ZS4K
Ck9uIFNhdCwgMjIgQXVnIDIwMjAgYXQgMDI6MDAsIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIGd1eXMsCj4KPiBzbyBJIGdv
dCBzb21lIGhhcmR3YXJlIGFuZCB0ZXN0ZWQgdGhpcyBhbmQgYWZ0ZXIgaGFtbWVyaW5nIG91dCB0
b25zIG9mIHR5cG9zIGl0IG5vdyBzZWVtcyB0byB3b3JrIGZpbmUuCj4KPiBDb3VsZCB5b3UgZ2l2
ZSBpdCBtb3JlIHRlc3Rpbmc/Cj4KPiBUaGFua3MgaW4gYWR2YW5jZSwKPiBDaHJpc3RpYW4KPgo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
